class Examples::SourceParser
  def self.parse(path : String)
    Try(Source).try {
      raise "src not found: #{path}" if !File.exists?(path)
      io = File.open(path)
      parse(path, io).get
    }
  end

  def self.parse(path : String, io : IO)
    path = Source.relative(path)
    Try(Source).try {
      comments = Array(Comment).new
      current : Comment? = nil
      line_no = 0
      while (line = io.gets)
        line_no += 1
        case line
        when /^\s*#\s*```(.*?)$/
          if current
            comments << current
            current = nil
          else
            current = Comment.new(path, line_no, $1)
          end
        when /^\s*# ?(.*?)$/
          current.try(&.<< $1)
        else
          if current
            raise Errors::UnexpectedEnd.new(path, line_no, line, current, comments)
          end
        end
      end
      Source.new(comments)
    }
  end
end
