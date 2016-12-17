class Examples::Pending
  var dir     = "pendings"
  var reasons = Hash(String, String).new

  delegate sha1, to: Source
  delegate size, to: reasons

  def initialize
    Dir.glob("#{dir}/**/*.cr").sort.each do |src|
      reasons[sha1(File.read(src))] = "file:#{src}"
    end
  end

  def pending?(comment : Comment)
    pending?(sha1(comment.code))
  end

  def pending?(sha1 : String)
    case sha1
    when /^[a-f0-9]{40}$/
      reasons[sha1]?
    else
      raise "invalid sha1: #{sha1[0,40]}...(#{sha1.size})"
    end
  end
end
