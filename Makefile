SHELL = /bin/bash
PROG = ./bin/crystal-examples

CRYSTAL_DIR = ./crystal

GEN_SPEC_SRCS := $(shell comm -23 <(cd gen/spec && find . -name '*.cr' | sort) <(cd gen/skip && find . -name '*.cr' | sort) | sed -e 's|^\.|gen/spec|')

GIT_VERSION  = ./gen/git_version.txt
DOC_COMP_OK  = ./gen/cache/compile/ok
DOC_COMP_NG  = ./gen/cache/compile/ng
DOC_SPEC     = ./gen/cache/spec
DOC_SPEC_OK  = ./gen/cache/spec/ok
DOC_SPEC_NG  = ./gen/cache/spec/ng
COUNT_ALL    = ./gen/cache/spec/count_all
COUNT_OK     = ./gen/cache/spec/count_ok
COUNT_OK_A   = ./gen/cache/spec/count_ok_all
COUNT_OK_P   = ./gen/cache/spec/count_ok_pending
COUNT_NG     = ./gen/cache/spec/count_ng
COUNT_SKIP   = ./gen/cache/spec/count_skip
COUNT_PD     = ./gen/cache/spec/count_pd
DOC_FIXTURES = ./gen/cache/spec/fixtures
GEN_SKIP     = ./gen/skip
GEN_SPEC     = ./gen/spec
DOCKER_LOG   = ./docker.log

COMPILE_CACHE = ./gen/cache/compile

# docker
UID = $(shell id -u)
PWD = $(shell pwd)
DOCKER_CRYSTAL = /tmp/crystal/bin/crystal
#DOCKER_IMAGE = crystallang/crystal:0.25.1
DOCKER_IMAGE = crystallang/crystal:nightly
DOCKER_MOUNT = -v ${PWD}/gen:/tmp/gen:ro -v ${PWD}/examples:/tmp/examples:ro
DOCKER_RUN = docker run --rm $(DOCKER_MOUNT) -w /tmp

CRYSTAL_CMD ?= ${DOCKER_RUN} -t $(DOCKER_IMAGE) crystal

.PHONY : all compile spec clean test

all: build version gen docker_spec status_bang

test: spec clean all

build:
	@if [ ! -f shard.lock ] ; then \
	  docker-compose run --rm crystal shards update;\
	fi
	docker-compose run --rm crystal

.PHONY : docs gitbook_gen gitbook_docs
docs: build gitbook_gen gitbook_docs

gitbook_gen:
	@rm -rf gitbook
	$(PROG) gitbook

gitbook_docs:
	gitbook build ./gitbook ./docs

.PHONY : travis
travis: spec clean build version gen generated_spec status_bang

spec:
	crystal spec -v --fail-fast

.PHONY : trusted_spec
trusted_spec:
	crystal spec -v gen/trusted/

.PHONY : generated_spec
generated_spec:
	@rm -f $(DOC_SPEC_OK) $(DOC_SPEC_NG)
	@mkdir -p $(DOC_SPEC)
	@touch $(DOC_SPEC_OK) $(DOC_SPEC_NG)
	@for x in $(GEN_SPEC_SRCS) ; do\
	  crystal spec -v "$$x" ;\
	  if [ $$? -eq 0 ] ; then echo $$x >> $(DOC_SPEC_OK); else echo $$x >> $(DOC_SPEC_NG); fi; \
	done

.PHONY : docker_spec
docker_spec:
	./$(PROG) version crystal > $(GIT_VERSION)
	@mkdir -p $(DOC_SPEC)
	@rm -f $(DOC_SPEC_OK) $(DOC_SPEC_NG)
	@touch $(DOC_SPEC_OK) $(DOC_SPEC_NG)
	@for x in $(GEN_SPEC_SRCS) ; do\
	  ./$(PROG) cache:spec get:1 "$$x";\
	  if [ $$? -eq 0 ] ; then\
	    echo "OK: $$x (cached)";\
	    echo $$x >> $(DOC_SPEC_OK);\
	  else \
	    $(DOCKER_RUN) -t $(DOCKER_IMAGE) crystal spec -v "$$x" ;\
	    if [ $$? -eq 0 ] ; then \
	      ./$(PROG) cache:spec set "$$x" ;\
	      echo $$x >> $(DOC_SPEC_OK); \
	    else \
	      echo $$x >> $(DOC_SPEC_NG); \
	    fi; \
	  fi; \
	done | tee $(DOCKER_LOG)

clean:
	@rm -rf ${PROG} ${DOC_SPEC} ${COMPILE_CACHE}

version:
	./${PROG} --version

check:
	@crystal src/bin/main.cr -- check crystal/src -E

.PHONY : gen
gen:
	@rm -rf gen/spec examples
	./${PROG} gen crystal/src

compile:
	./${PROG} compile -c "${CRYSTAL_CMD}"

.PHONY : docker
docker:
	$(DOCKER_RUN) -it $(DOCKER_IMAGE) bash

.PHONY : status
status: status_spec status_example

.PHONY : status_spec
status_spec:
	@echo -n "Specs `find gen/spec -name '*.cr' |wc -l` ("
	@echo -n   "`wc -l < $(DOC_SPEC_OK)` successes, "
	@echo -n   "`wc -l < $(DOC_SPEC_NG)` failures, "
	@echo -n   "`find $(GEN_SKIP) -name '*.cr' |wc -l` pending"
	@echo -n ")"
	@echo

.PHONY : status_example
status_example:
	@cat "$(DOC_SPEC_OK)" | xargs cat | grep -c :example: > $(COUNT_OK_A) | true
	@find "$(GEN_SPEC)" -type f | xargs cat | grep -c :example: > $(COUNT_ALL) | true
	@find "$(GEN_SKIP)" -type f | xargs cat | grep -c :example: > $(COUNT_SKIP) | true
	@cat "$(DOC_SPEC_OK)" | xargs cat | grep -c :pending: > $(COUNT_OK_P) | true
	@cat "$(DOC_SPEC_NG)" | xargs cat | grep -c :example: > $(COUNT_NG) | true
	@expr `cat $(COUNT_OK_A)` - `cat $(COUNT_OK_P)` > $(COUNT_OK) | true
	@expr `cat "$(COUNT_ALL)"` - `cat "$(COUNT_OK)"` - `cat "$(COUNT_NG)"` + `cat "$(COUNT_SKIP)"` > "$(COUNT_PD)"
	@echo -n "Examples `cat $(COUNT_ALL)` ("
	@echo -n   "`cat $(COUNT_OK)` successes, "
	@echo -n   "`cat $(COUNT_NG)` failures, "
	@echo -n   "`cat $(COUNT_PD)` pending"
	@echo -n ")"
	@echo

.PHONY : status_compile
status_compile:
	@echo -n "Compile ("
	@echo -n   "`wc -l < $(DOC_COMP_OK)` successes, "
	@echo -n   "`wc -l < $(DOC_COMP_NG)` failures"
	@echo -n ")"
	@echo

.PHONY : gen_fixtures
gen_fixtures:
	find examples/ -type f | xargs cat | grep '^[^ #].*#' | sort | uniq > $(DOC_FIXTURES)


# check all generated spec succeeded for travis result
.PHONY : spec_succeeded
spec_succeeded:
	@test `wc -l < $(DOC_SPEC_NG)` = 0

.PHONY : status_bang
status_bang: status spec_succeeded
