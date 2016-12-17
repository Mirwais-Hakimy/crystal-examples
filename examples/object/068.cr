# object.cr:1067
class StringWrapper
  def initialize(@string : String)
  end

  delegate downcase, to: @string
  delegate gsub, to: @string
  delegate empty?, capitalize, to: @string
  delegate :[], to: @string
end

wrapper = StringWrapper.new "HELLO"
wrapper.downcase       # => "hello"
wrapper.gsub(/E/, "A") # => "HALLO"
wrapper.empty?         # => false
wrapper.capitalize     # => "Hello"
