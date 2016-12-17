# zip/reader.cr: 1 examples
require "zip"

# zip/reader.cr:13 (001.cr)
# pending by 'file:pendings/zip/reader/001.cr'
# File.open("./file.zip") do |file|
#   Zip::Reader.open(file) do |zip|
#     zip.each_entry do |entry|
#       p entry.filename
#       p entry.file?
#       p entry.dir?
#       p entry.io.gets_to_end
#     end
#   end
# end
