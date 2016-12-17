class Examples::Compiler
  var examples_dir       = "examples"
  var cache_dir          = "gen/cache/compile"
  var cache : Cache      = Cache.load("#{cache_dir}/cache")
  var success_cnt        = 0
  var failure_cnt        = 0
  var pending_cnt        = 0
  var cached_success_cnt = 0
  var cached_failure_cnt = 0

  var crystal       = "crystal"
  var limit : Int32 = Int32::MAX
  var all_passed    = Set(String).new
  var pending       = Pending.new

  var alls : Array(String) = Dir.glob("#{examples_dir}/**/all.cr").sort
  var srcs : Array(String) = (Dir.glob("#{examples_dir}/**/*.cr").sort - alls).reject(&.=~ %r(/compiler/))

  var opened_files = Array(File).new
  var file_requested : File = open_file("requested")
  var file_ok        : File = open_file("ok")
  var file_ng        : File = open_file("ng")
  var file_pending   : File = open_file("pending")
  var file_log       : File = open_file("log")

  enum Result
    Compiled
    Failed
    Pending
  end

  def compile
    FileUtils.mkdir_p(cache_dir)

    # First, mark requested flags
    file_requested.puts srcs.join("\n")

    # Second, check all examples for fast check
    alls.each do |file|
      # file : "examples/atomic/all.cr"
      case res = process(file, count: false)
      when Result::Compiled
        all_passed << File.dirname(file)
        out "OK: #{file}".colorize.green
      when Result::Failed
        out "NG: #{file}".colorize.red
      when Result::Pending
        out "PENDING: #{file}".colorize.yellow
      else
        raise "BUG: process got #{res} (#{file})"
      end
    end

    # Finally, check each examples
    srcs.each_with_index do |file, i|
      return if i >= limit
      label = "(%04d/%04d) compile: %s" % [i+1, srcs.size, file]
      case res = process(file, count: true)
      when Result::Compiled
        on_success(file, label)
      when Result::Failed
        on_failure(file, label)
      when Result::Pending
        on_pending(file, label)
      else
        raise "BUG: process got #{res} (#{file})"
      end
    end
  ensure
    out "success: %d(cached: %d), failure: %d(cached: %d)" %
        [success_cnt, cached_success_cnt, failure_cnt, cached_failure_cnt]
    cache.save
    opened_files.each(&.close)
    opened_files.clear
  end

  private def process(file : String, count : Bool) : Result
    cache_hit_hook = ->(b : Bool){
      if count
        if b
          self.cached_success_cnt += 1
        else
          self.cached_failure_cnt += 1
        end
      end
    }

    sha1 = Source.sha1(File.read(file))

    # check pending examples
    return Result::Pending if pending.pending?(sha1)
    
    # first cache by `all.cr` except pending one
    if all_passed.includes?(File.dirname(file))
      cache_hit_hook.call(true)
      return Result::Compiled
    end
    
    # second cache by `cache` file
    if cache.bool?(sha1)
      # only when cache hit and it is true
      cache_hit_hook.call(true)
      return Result::Compiled
    else
      # ignore negative cache for the case of updating sources
      bool = compile(file)
      clue = file.sub(/^#{examples_dir}\//, "")
      cache.bool(sha1, bool, clue)
      cache.save
      return bool ? Result::Compiled : Result::Failed
    end
  end

  private def compile(file) : Bool
    seq = Shell::Seq.new
    seq.run "#{crystal} build -o /dev/null #{file}"
    return seq.success?
  end

  private def on_success(file, label)
    self.success_cnt += 1
    out "OK: #{label}"
    file_ok.puts file
    file_ok.flush
  end

  private def on_failure(file, label)
    self.failure_cnt += 1
    out "NG: #{label}".colorize.red
    file_ng.puts file
    file_ng.flush
  end

  private def on_pending(file, label)
    self.pending_cnt += 1
    out "PENDING: #{label}".colorize.yellow
    file_pending.puts file
    file_pending.flush
  end

  private def open_file(name)
    File.open("#{cache_dir}/#{name}", "w+").tap{|f|
      opened_files << f
    }
  end

  private def out(msg)
    STDOUT.puts msg
    file_log.puts msg
    file_log.flush
  end
end
