# zip/file.cr: 1 examples
require "zip"

# zip/file.cr:8 (001.cr)
# pending by 'file:pendings/zip/file/001.cr'
# Zip::File.open("./file.zip") do |file|
#   # Iterate through all entries printing their filename and contents
#   file.entries.each do |entry|
#     p entry.filename
#     entry.open do |io|
#       p io.gets_to_end
#     end
#   end
# 
#   # Random access to entries by filename is also provided
#   entry = file["some_file.txt"]
#   entry.open do |io|
#     p io.gets_to_end
#   end
# end
