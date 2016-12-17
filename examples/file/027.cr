# file.cr:711
File.write("foobar", "foo\nbar")
File.read_lines("foobar") # => ["foo", "bar"]
