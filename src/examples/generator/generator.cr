class Examples::Generator::Generator
  property relative
  property auto_require
  property skip_error

  def initialize(@relative : String, @comments : Array(Comment), @pending : Pending)
    raise "path should be relative: #{@relative}" if @relative.starts_with?("/")
    @dir  = File.dirname(@relative)
    @name = File.basename(@relative, ".cr")
    @auto_require = false
    @skip_error = false
  end

  def gen_example(prefix)
    dir = File.join(prefix, @dir, @name)
    FileUtils.mkdir_p(dir)

    require_code = @comments[0].require_code?
    require_code ||= build_require_code

    gen_each_examples(dir, require_code)
    gen_all_example(dir, require_code)
  end

  # create one by one example files. (ex. `examples/array/001.cr`)
  def gen_each_examples(dir, require_code)
    @comments.each_with_index do |c, i|
      dst = File.join(dir, "%03d.cr" % (i+1))
      head = "# #{@relative}:#{c.line}\n"
      req  = "#{require_code}\n" if require_code && !c.require_code?
      code = build_example(c)
      File.write(dst, "#{head}#{req}#{code}\n")
    end
  end

  # concatinate all examples into one file. (ex. `examples/array/all.cr`)
  def gen_all_example(dir, require_code)
    dst = File.join(dir, "all.cr")
    File.open(dst, "w+") {|f|
      f.puts "# #{@relative}: #{@comments.size} examples"
      f.puts require_code if require_code
      @comments.each_with_index do |c, i|
        seq = "%03d.cr" % (i+1)
        f.puts "\n# #{@relative}:#{c.line} (#{seq})"
        if reason = @pending.pending?(c)
          f.puts "# pending by '#{reason}'"
          f.puts build_example(c).gsub(/^/m, "# ")
        else
          f.puts build_example(c)
        end
      end
    }
  end
  
  def gen_code(prefix)
    dir = File.join(prefix, @dir, @name)
    FileUtils.mkdir_p(dir)

    require_code = @comments[0].require_code?
    require_code ||= build_require_code

    gen_each_codes(dir, require_code)
  end

  # create one by one example files. (ex. `examples/array/001.cr`)
  def gen_each_codes(dir, require_code)
    @comments.each_with_index do |c, i|
      dst = File.join(dir, "%03d.cr" % (i+1))
      head = "# #{@relative}:#{c.line}\n"
      req  = "#{require_code}\n" if require_code && !c.require_code?
      code = build_code(c)
      File.write(dst, "#{head}#{req}#{code}\n")
    end
  end

  def gen_spec(prefix)
    dir = File.join(prefix, @dir)
    dst = File.join(dir, "#{@name}_spec.cr")
    FileUtils.mkdir_p(dir)
    File.write(dst, spec_code)
  end

  private def build_example(c : Comment)
    return c.code if !skip_error
    ExampleBuilder.new(c).build
  end

  private def build_code(c : Comment)
    CodeBuilder.new(c).build
  end

  private def build_spec_code(c : Comment)
    c.lines.map{|line| CommentSpec.parse(line)}.join("\n")
  end

  private def require_codes
    names = Set(String).new
    @comments.each do |comment|
      comment.lines.each do |line|
        case line
        when /^\s*require\s+"(.*?)"/
          names << %(require "#{$1}")
        end
      end
    end
    build_require_code.try{|c| names << c} if names.empty?
    names.to_a.sort
  end

  private def spec_code
    body = spec_body
    String.build do |s|
      s.puts "require \"spec\""
      s.puts require_codes.join("\n")
      if declare_dynamically?
        # TODO: move dynamically declaration into top
        s.puts body
      else
        s.puts "it \"#{@relative}\" do"
        s.puts "puts # :nocode:"
        s.puts
        s.puts body
        s.puts
        s.puts "end"
      end
    end
  end

  private def spec_body
    String.build do |s|
      @comments.each_with_index do |c, i|
        seq = "%03d.cr" % (i+1)
        s.puts "puts \"# #{@relative}:#{c.line} (#{seq})\" # :nocode: :example:"
        if reason = @pending.pending?(c)
          s.puts "# pending by '#{reason}' # :pending:"
          s.puts build_example(c).gsub(/^/m, "# ")
        else
          s.puts build_spec_code(c)
        end
        s.puts ""
      end
    end
  end

  private def declare_dynamically?
    @comments.each do |c|
      return true if c.lines.any?{|line| line =~ /^\s*(def|enum|class|module|struct)\s+/}
    end
    return false
  end
  
  private def build_require_code : String?
    return nil if !@auto_require
    RULES.each do |entry|
      return entry.code(@relative) if entry.match?(@relative)
    end

    raise "BUG: broken REQUIRE_RULES"
  end
end
