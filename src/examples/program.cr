class Examples::Program
  enum Type
    COMPILE
    SPEC
  end

  def initialize(@config : TOML::Config)
  end

  def cache(type : Type, action : String, file : String)
    raise "file not found: #{file}" if ! File.exists?(file)
    sha1 = Source.sha1(File.read(file))
    cache = Cache.load("gen/cache/#{type.to_s.downcase}/cache")
    case action
    when /^get:(.*)/
      cache.entry?(sha1).try{|v| puts v} if verbose?
      exit ($1 == cache[sha1]?) ? 0 : 1
    when "get"
      cache.entry?(sha1).try{|v| puts v}
    when /^set:(.*)/
      cache.set(sha1, $1, file)
      cache.save
    when "set"
      cache.set(sha1, "1", file)
      cache.save
    else
      raise "invalid cache action: #{action}"
    end
  end

  def check(src : String)
    found = 0
    error = 0
    scan(src) do |path, try|
      case try
      when Success
        found += try.get.comments.size
      when Failure
        if @config["failfast"]
          try.get
        else
          err = try.failed.value
          STDERR.puts "#{try.failed.value}\n"
          error += 1
          found += err.comments.size if err.is_a?(Errors::Parsing)
        end
      end
    end

    if error > 0
      puts "Found #{found} examples, but got #{error} errors"
      exit 1
    else
      puts "Found #{found} examples"
    end
  end

  def compile(crystal, n)
    c = Compiler.new
    c.crystal = crystal
    c.limit = n
    c.compile
  end

  def count(src : String)
    sum = 0
    out = ->(path : String, count : Int32, err : String?){
      err &&= " # #{err}"
      STDOUT.puts "%s: %d%s" % [path, count, err]
      sum += count
    }
    
    scan(src) do |path, try|
      case try
      when Success
        s = try.get
        if s.comments.any? || verbose?
          out.call(path, s.comments.size, nil)
        end
      when Failure
        err = try.failed.value
        cnt = (err.is_a?(Errors::Parsing) ? err.comments.size : 0)
        out.call(path, cnt, err.class.name)
      end
    end
    STDOUT.puts "# Found #{sum} examples"
  end

  def gen(src : String)
    files = 0
    specs = 0
    error_files = Array(String).new
    pending = build_pending
    
    code_compile_builder = ->(io : IO, c : Comment){
      c.lines.each do |line|
        io.puts "    #{line}"
      end
    }
    generate = ->(path : String, comments: Array(Comment)){
      comments = comments.select(&.crystal?)
      if comments.any?
        gen = Generator::Generator.new(path, comments, pending)
        gen.auto_require = true if @config["autoreq"]
        gen.skip_error   = true if @config["skiperr"]
        gen.gen_example("examples")
        gen.gen_code("gen/code")
        gen.gen_spec("gen/spec")
        files += 1
        specs += comments.size
      end
    }
    scan(src) do |path, try|
      case try
      when Success
        generate.call(path, try.get.comments)
      when Failure
        case err = try.failed.value
        when Errors::Parsing
          generate.call(path, err.comments)
        end
        
        STDERR.puts err.message
        STDERR.puts "skip: #{path}"
        error_files << path
      end
    end

    STDOUT.puts "Created #{files} files, #{specs} specs in gen/spec/".colorize.green
    if error_files.any?
      STDERR.puts "Found #{error_files.size} errors while parsing comments".colorize.yellow
      error_files.each do |path|
        STDERR.puts "  #{path}".colorize.yellow
      end
      exit 1
    end
  end

  def gitbook(limit, dryrun)
    gitbook = Generator::Gitbook.new
    gitbook.limit = limit
    gitbook.run(dryrun)
  end
  
  def pending(src : String)
    # src: "examples/digest/base/001.cr"
    # dst: "pendings/digest/base/001.cr"
    case src
    when /^examples/
      dst = src.sub(/^examples/, "pendings")
      Dir.mkdir_p(File.dirname(dst))
      FileUtils.cp(src, dst)
      puts "Marked as pending: '%s'" % dst
    else
      abort "target file should be in 'examples/*'"
    end
  end

  def sha1(file : String)
    debug = verbose? ? STDERR : nil
    puts Source.sha1(File.read(file), debug: debug)
  end

  def show(file : String)
    src = Source.parse(file).get
    src.comments.each do |c|
      puts "#" * 80
      puts "# #{file}"
      c.lines.each{|line| puts line}
      puts ""
    end
  end

  def spec(file : String)
    code = File.read_lines(file).map{|line| CommentSpec.parse(line)}.join("\n")
    puts Source.code(code)
  end

  def version
    puts get_version
  end

  private def scan(src : String)
    return if is_compiler?(src)
    if Dir.exists?(src)
      src = src.chomp("/")
      Dir.glob("#{src}/**/*.cr").sort.each do |file|
        next if is_compiler?(file)
        yield Source.relative(file), Source.parse(file)
      end
    else
      yield Source.relative(src), Source.parse(src)
    end
  end

  private def is_compiler?(file)
    file =~ %r(/compiler/)
  end

  private def build_pending
    Pending.new.tap{|p|
      STDOUT.puts "pending: %d examples." % p.size
    }
  end

  private def verbose?
    @config["verbose"]
  end

  # original: src/compiler/crystal/config.cr
  private def get_version
    version, sha = compute_version_and_sha
    if sha
      "#{version} [#{sha}]"
    else
      "#{version}"
    end
  end

  private def compute_version_and_sha
    git_version = `(cd crystal && git describe --tags --long --always 2>/dev/null)`.chomp
    return { Crystal::VERSION, nil } if git_version.empty?

    return { "#{Crystal::VERSION}+?", git_version} unless git_version.includes? '-'

    tag, commits, sha = git_version.split("-")
    sha = sha[1..-1]                                # Strip g
    tag = "#{tag}+#{commits}" unless commits == "0" # Reappend commits since release unless we hit it exactly
    {tag, sha}
  end
end
