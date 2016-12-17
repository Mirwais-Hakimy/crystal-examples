# file.cr:803
File.write("afile", "foo")
File.exists?("afile") # => true

File.rename("afile", "afile.cr")
File.exists?("afile")    # => false
File.exists?("afile.cr") # => true
