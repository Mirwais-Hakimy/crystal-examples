# dir.cr:215
Dir.mkdir("bar")
Dir.empty?("bar") # => true
File.write("bar/a_file", "The content")
Dir.empty?("bar") # => false
