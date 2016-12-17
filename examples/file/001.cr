# file.cr:5
file = File.new("path/to/file")
content = file.gets_to_end
file.close

# Implicit close with `open`
content = File.open("path/to/file") do |file|
  file.gets_to_end
end

# Shortcut:
content = File.read("path/to/file")
