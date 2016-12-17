# gzip/reader.cr:17
require "gzip"

File.write("file.gzip", Bytes[31, 139, 8, 0, 0, 0, 0, 0, 0, 3, 75, 76, 74, 6, 0, 194, 65, 36, 53, 3, 0, 0, 0])

string = File.open("file.gzip") do |file|
  Gzip::Reader.open(file) do |gzip|
    gzip.gets_to_end
  end
end
string # => "abc"
