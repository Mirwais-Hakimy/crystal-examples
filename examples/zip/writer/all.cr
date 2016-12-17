# zip/writer.cr: 1 examples
require "zip"

# zip/writer.cr:7 (001.cr)
# pending by 'file:pendings/zip/writer/001.cr'
# File.open("./file.zip", "w") do |file|
#   Zip::Writer.open(file) do |zip|
#     # Add a file with a String content
#     zip.add "foo.txt", "contents of foo"
# 
#     # Add a file and write data to it through an IO
#     zip.add("bar.txt") do |io|
#       io << "contents of bar"
#     end
# 
#     # Add a file by referencing a file in the filesystem
#     # (the file is automatically closed after this call)
#     zip.add("baz.txt", File.open("./some_file.txt"))
#   end
# end
