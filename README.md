# crystal-examples [![Build Status](https://travis-ci.org/maiha/crystal-examples.svg?branch=master)](https://travis-ci.org/maiha/crystal-examples)

crystal examples checker

## Usage: 1st time

First, prepare source directory in `./crystal/src`.
```shell
git clone https://github.com/crystal-lang/crystal.git
# or `ln -s /opt/crystal .`
```

Run `make test` !

```shell
make test
```

## Usage: fix examples

Assumed that you got error

```
# file_utils.cr:334 (024.cr)
file_utils.cr

Failures:
```

This means that there is an error in the 24th example in `file_utils.cr`.
And the code is extracted to the following file.
- `examples/file_utils/024.cr` as codes
- `gen/spec/file_utils_spec.cr` as spec

Here, you have two choices **modify** or **ignore**.
##### modify
If you can fix it, modify `./crystal/src/file_utils.cr` correctly.

##### ignore
If you want to ignore it, copy the **examples** code into **pendings**. Or just run `pending` command.
All files in `./pendings/**/*.cr` will be skipped.

```shell
./bin/crystal-examples pending examples/file_utils/024.cr
```

Then, run just `make` that use previous results as cache.

```shell
make
```

Loop this **fix examles** step until all tests will pass!

## Usage: FULL

#### `make check` # scan and count examples
- `Found 1233 examples`

#### `make gen` # generates
- [examples/](./examples/) # extracted example files (1 example has 1 file)
- [gen/spec/](./gen/spec/) # converted into spec file (1 class has 1 file)

#### `make compile` # compiles `./examples/*.cr` by using cache
- [gen/cache/compile/ok](./gen/cache/compile/ok) # OK logs
- [gen/cache/compile/ng](./gen/cache/compile/ng) # NG logs
- [gen/cache/compile/pending](./gen/cache/compile/pending)   # pending logs
- [gen/cache/compile/cache](./gen/cache/compile/cache) # Delete this to re-compile all

#### `make docker_spec` # run specs in `./gen/spec/` by using cache in docker
- [gen/cache/spec/log](./gen/cache/spec/log) # last result
- [gen/cache/spec/cache](./gen/cache/spec/cache) # Delete this to re-spec all

#### `make test` # Run all at once: `spec`, `gen`, `docker_spec`

#### `make docs` # Create document (requires **gitbook**)
- [docs/](./docs/)

## Pending controls

#### not wanted to generate codes

- [pendings/](./pendings/) # Pseudo codes or some stuff can be ignored by putting them here. (managed by SHA1)

For example, if you want to pending `examples/big/big_decimal/001.cr`, put it into `pendings` keeping relative path.
```shell
mkdir -p pendings/big/big_decimal/
cp {examples,pendings}/big/big_decimal/001.cr

make gen # rebuild files to respect `pendings/*`
```

#### not wanted to run specs

- [gen/skip/](./gen/skip/) # These files are skipped for spec execution.

## Format and rules

- https://github.com/maiha/comment-spec.cr

## Caution

Generated crystal codes in `examples` and `gen/spec` may destroy your server.
Please be careful and check the code before run.

## Spec

#### `make spec`

- executes unit tests about this application itself

#### `make generated_spec` (should be used in TravisCI or docker) (!!!DANGER!!!)

- executes generated spec files filtered by `gen/skip` in current host. 

#### `make docker_spec`

- executes same as `generated_spec` except running in docker containers. 
(needs docker image: see `DOCKER_IMAGE` in **Makefile**)

#### `make status`

- shows statistics about the examples.

```
Specs 126 (102 successes, 4 failures, 20 pending)
Examples 1190 (994 successes, 9 failures, 187 pending)
```

#### `make gen_fixtures` generates

- [gen/cache/spec/fixtures](./gen/cache/spec/fixtures) # fixture data (used for `comment-spec.cr`)


## TODO

#### named_tuple.cr (004.cr)
```
in macro 'macro_139940195313632' /tmp/crystal/src/named_tuple.cr:77, line 4:

   1.
   2.       NamedTuple.new(
   3.
>  4.         "thing": self[:thing].cast(hash.fetch(:thing) { hash["thing"] }),
   5.
   6.         "n": self[:n].cast(hash.fetch(:n) { hash["n"] }),
   7.
   8.       )
   9.
```

#### number.cr:173 (009.cr)

```
Failures:

  1) number.cr
     Failure/Error: ( 1234.567.significant(5) ).try(&.to_f).to_s.should eq( "1234.6" )

       Expected: "1234.6"
            got: "1234.6000000000001"
```

#### regex/match_data.cr (013.cr,015.cr)

```
Failures:

  1) regex/match_data.cr
     Failure/Error: ( "Crystal".match(/(?<ok>Cr)|(?<ok>al)/).not_nil!["ok"] ).to_s.should eq( "al" )

       Expected: "al"
            got: "Cr"
```

#### slice.cr:260 (012.cr)

```
Failures:

  1) slice.cr
     Failure/Error: ( slice.map &.to_s ).should eq( Slice["1", "2.5", "a"] )

       Expected: Slice["1", "2.5", "a"] : Slice(String)
            got: Slice["1", "2.5", "a"] : Slice(String)
```

```
a = Slice[1, 2.5, "a"].map(&.to_s) # => Slice["1", "2.5", "a"]
b = Slice["1", "2.5", "a"]         # => Slice["1", "2.5", "a"]
a == b                             # => false
```

#### weak_ref.cr
```crystal
require "weak_ref"

ref = WeakRef.new("oof".reverse)
ref.value # => "foo"
GC.collect
ref.value # => "foo"
```

#### yaml/schema/core.cr

```
in gen/spec/yaml/schema/core_spec.cr:8: instantiating '(Bool | Float64 | Int64 | String | Time | Nil)#try()'

( YAML::Schema::Core.parse_scalar("1.2") ).try(&.to_f).to_s.should eq( "1.2" )
                                           ^~~
```

#### http/params.cr:273 (017.cr)
- `to_s` should escape @ to %40 ?

#### io/memory.cr:355 (014.cr)
- wrong usage
- https://github.com/crystal-lang/crystal/issues/3807

#### io.cr:544 (021.cr)
- What happen when `gets_to_end` is called twice?

#### named_tuple.cr:42 (003.cr)
- casting Int32 to Int64

#### object.cr
- almost using macros

#### socket.cr
- creates real connections

#### tuple.cr
- casting Int32 to Int64


## Contributing

1. Fork it ( https://github.com/maiha/crystal-examples/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [maiha](https://github.com/maiha) maiha - creator, maintainer
