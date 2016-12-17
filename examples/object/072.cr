# object.cr:1169
class StringWrapper
  def initialize(@string : String)
  end

  forward_missing_to @string
end

wrapper = StringWrapper.new "HELLO"
wrapper.downcase       # => "hello"
wrapper.gsub(/E/, "A") # => "HALLO"
