class Examples::Generator::CodeBuilder
  def initialize(@comment : Comment)
  end

  def build
    @comment.lines.join("\n")
  end
end
