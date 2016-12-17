# http/formdata/builder.cr: 2 examples
require "http"

# http/formdata/builder.cr:6 (001.cr)
io = IO::Memory.new
builder = HTTP::FormData::Builder.new(io, "aA47")
builder.field("name", "joe")
file = IO::Memory.new("file contents")
builder.file("upload", file, HTTP::FormData::FileMetadata.new(filename: "test.txt"))
builder.finish
io.to_s # => "--aA47\r\nContent-Disposition: form-data; name=\"name\"\r\n\r\njoe\r\n--aA47\r\nContent-Disposition: form-data; name=\"upload\"; filename=\"test.txt\"\r\n\r\nfile contents\r\n--aA47--"

# http/formdata/builder.cr:26 (002.cr)
builder = HTTP::FormData::Builder.new(io, "a4VF")
builder.content_type # => "multipart/form-data; boundary=\"a4VF\""
