class Examples::Generator::Gitbook
  var src_dir = "gen/code"
  var dst_dir = "gitbook"
  var limit : Int32 = Int32::MAX

  enum Status
    SUCCESS                     # spec passed
    PENDING                     # pending by user
    FAILURE                     # spec failed
    ERROR                       # compilation error
    UNKNOWN                     # unknown status
  end

  StatusCssClass = {
    Status::SUCCESS => "success",
    Status::PENDING => "warning",
    Status::FAILURE => "error",
    Status::ERROR   => "error",
    Status::UNKNOWN => "error",
  }

  StatusHtml = {
    Status::SUCCESS => "<span class='success'>OK</span>",
    Status::PENDING => "<span class='warning'>pending</span>",
    Status::FAILURE => "<span class='error'>spec failed</span>",
    Status::ERROR   => "<span class='error'>compile error</span>",
    Status::UNKNOWN => "<span class='error'>unknown status</span>",
  }

  alias Codes  = Array(Code)
  alias Counts = Hash(Status, Int32)

  record Code, klass : Klass, path : String, code : String, line : Int32?, status : Status
  
  record Klass, path : String, codes : Codes = Codes.new, counts : Counts = Counts.new do
    def name
      path.split("/").map{|i| i.capitalize.gsub(/_(.)/){$1.capitalize}}.join("::")
    end
    def status; codes.map(&.status).max; end
  end

  delegate crystal_git, to: Examples::Info # "0.25.1+14 [cc182ce78]"
  delegate crystal_tag, to: Examples::Info # "0.25.1+14"
  delegate crystal_ver, to: Examples::Info # "0.25.1"
  delegate sha1, to: Examples::Source

  var klasses : Hash(String, Klass) = build_klasses
  var pending     = Pending.new
  var code_status = Examples::Info::CodeStatus.new
  var spec_status = Examples::Info::SpecStatus.new
  var compile_cache : Cache = Cache.compile_cache
  var spec_cache    : Cache = Cache.spec_cache

  def run(dryrun : Bool = false)
    if dryrun
      test
    else
      gen
    end
  end

  def gen
    gen_readme
    gen_side
    gen_pages

    gen_book
  end

  def test
    test_status
  end

  private def write!(file, buf)
    FileUtils.mkdir_p File.dirname(file)
    File.write(file, buf)
  end

  private def build_klasses : Hash(String, Klass)
    klasses = Hash(String, Klass).new

    Dir["#{src_dir}/**/*.cr"].sort.each.first(limit).each do |src|
      src                                              # "gen/code/array/001.cr"
      base = src.sub("#{src_dir}/","").sub(/\.cr$/,"") # "array/001"
      path = base.sub(/\/\d+$/,"")                     # "array"
      klasses[path] = Klass.new(path) if !klasses.has_key?(path)
      klass = klasses[path]
      code, line = read_code(src)
      status = get_code_status(klass, base, code)
      klass.codes << Code.new(klass, base, code, line, status)
    end
    return klasses
  end

  private def gen_side
    dst = File.join(dst_dir, "SUMMARY.md")
    buf = String.build do |s|
      s.puts "* [Crystal Examples](README.md)"
      s.puts "### standard library"
      klasses.each do |path, klass|
        indent = "  " * klass.name.split(/::/).size
        s.puts "#{indent}* [#{klass.name}](#{path}/README.md)"
      end
    end
    write!(dst, buf)
  end

  private def gen_readme
    dst = File.join(dst_dir, "README.md")
    buf = build_readme_md
    write!(dst, buf)
  end

  private def gen_pages
    klasses.each do |path, klass|
      dst = File.join(dst_dir, klass.path, "README.md")
      buf = build_page_md(klass)
      write!(dst, buf)
    end
  end
  
  private def get_status_status(status)
    return Status::FAILURE if status.ng?
    return Status::PENDING if status.pd?
    return Status::SUCCESS
  end

  private def get_code_status(klass, base, code)
    return Status::PENDING if pending.pending?(sha1(code))
    return Status::FAILURE if spec_status.ngs.includes?(klass.path)

    try = compile_cache.try_bool?(sha1(code))
    return Status::ERROR if try.success? && (try.get == false)

    return Status::SUCCESS if spec_status.oks.includes?(klass.path)
    return Status::UNKNOWN
  end

  private def read_code(file)
    code = File.read(file)
    case code
    when /\A#\s+([^:\n]+):(\d+)\n(.*)\Z/m
      # atomic.cr:22
      return {$3, $2.to_i + 1}
    else
      return {code, nil}
    end
  end

  private def klass_badge(klass)
    pd = klass.pd
    return "<span class=badge data-badge=#{pd}>xxx</span>" if pd > 0
    return nil
  end
  
  private def gen_book
    FileUtils.cp("assets/styles.css", "#{dst_dir}/")
    FileUtils.cp("assets/book.json" , "#{dst_dir}/")
  end

  private def build_readme_md
    all = spec_status.all
    oks = spec_status.oks
    ngs = spec_status.ngs
    pds = spec_status.pds

    code_css = StatusCssClass[get_status_status(code_status)]
    spec_css = StatusCssClass[get_status_status(spec_status)]

    return String.build do |s|
      s.puts "# Crystal examples"
      s.puts "- Crystal version: %s" % Examples::Info.crystal_git
      s.puts "- <span class='%s'>Specs %s</span>"    % [spec_css, spec_status]
      s.puts "- <span class='%s'>Examples %s</span>" % [code_css, code_status]
      s.puts "- created by: https://github.com/maiha/crystal-examples"
      s.puts

      if ngs.any?
        s.puts "### Specs: failures"
        s.puts
        ngs.each do |file|
          s.puts "- %s" % file
        end
        s.puts
      end

      if pds.any?
        s.puts "### Specs: pending"
        s.puts
        pds.each do |file|
          s.puts "- %s" % file
        end
        s.puts
      end
    end
  end

  private def build_page_md(klass)
    total     = klass.codes.size
    successes = klass.codes.count(&.status.success?)
    failures  = klass.codes.count(&.status.failure?)
    errors    = klass.codes.count(&.status.error?)
    pendings  = klass.codes.count(&.status.pending?)
    unknown   = klass.codes.count(&.status.unknown?)

    css = StatusCssClass[klass.status]
    String.build do |s|
      s.puts "# <div class=%s>%s</div>" % [css, klass.name]
      s.puts "<span class=%s>%d (%d successes, %d failures, %d errors, %d pending, %d unknown)</span>" % [css, total, successes, failures, errors, pendings, unknown]
      s.puts
      klass.codes.each do |code|
        seq = File.basename(code.path)
        url = "https://github.com/crystal-lang/crystal/blob/%s/src/%s.cr" % [crystal_ver, klass.path]
        url = "#{url}#L#{code.line}" if code.line
        s.puts "#### %s: %s" % [seq, StatusHtml[code.status]]
        s.puts url
        s.puts "```crystal"
        s.puts code.code
        s.puts "```"
        s.puts
      end
    end
  end

  private def test_status
    klasses.each do |path, klass|
      klass.codes.each do |code|
        p [code.path, code.status]
      end
    end
  end
end
