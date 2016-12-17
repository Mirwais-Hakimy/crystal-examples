class Examples::Generator::ExampleBuilder
  def self.build(line)
    case line
    when /#.*?error/i
      "# #{line}"
    else
      line
    end
  end
  
  def initialize(@comment : Comment)
  end

  def build
    @comment.lines.map{|line| self.class.build(line)}.join("\n")
  end
end
