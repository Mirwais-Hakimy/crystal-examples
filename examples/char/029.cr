# char.cr:437
('\u0000'..'\u0019').each do |char|
  char.control? # => true
end

('\u007F'..'\u009F').each do |char|
  char.control? # => true
end
