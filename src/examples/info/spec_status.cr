class Examples::Info::SpecStatus
  var all : Set(String) = oks | ngs | pds
  var oks : Set(String) = load_set("gen/cache/spec/ok")
  var ngs : Set(String) = load_set("gen/cache/spec/ng")
  var pds : Set(String) = load_skips

  def ng?; ngs.any?; end
  def pd?; pds.any?; end
  
  def to_s(io : IO)
    io << "%d (%d successes, %d  failures, %d  pending)" % [all.size, oks.size, ngs.size, pds.size]
  end

  private def load_skips
    Dir.cd("gen/skip") { Dir["**/*.cr"].to_a.map(&.sub(/_spec\.cr$/,"")).sort.to_set }
  end

  private def load_set(file : String) : Set(String)
    if File.exists?(file)
      File.read_lines(file).map(&.sub("gen/spec/", "").sub(/_spec\.cr$/,"")).to_set
    else
      STDERR.puts "#{self.class}#load_set('#{file}'): not found"
      Set(String).new
    end
  end
end
