# file.cr:268
File.write("foo", "")
File.delete("./foo")
File.delete("./bar") # raises Errno (No such file or directory)
