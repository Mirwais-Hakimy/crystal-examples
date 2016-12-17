# http/formdata/builder.cr:6
require "http"
io = IO::Memory.new
builder = HTTP::FormData::Builder.new(io, "aA47")
builder.field("name", "joe")
file = IO::Memory.new("file contents")
builder.file("upload", file, HTTP::FormData::FileMetadata.new(filename: "test.txt"))
builder.finish
io.to_s # => "--aA47\r\nContent-Disposition: form-data; name=\"name\"\r\n\r\njoe\r\n--aA47\r\nContent-Disposition: form-data; name=\"upload\"; filename=\"test.txt\"\r\n\r\nfile contents\r\n--aA47--"
