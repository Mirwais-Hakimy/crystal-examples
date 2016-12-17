# http/formdata.cr:172
require "http"
io = IO::Memory.new
HTTP::FormData.build(io, "boundary") do |builder|
  builder.field("foo", "bar")
end
io.to_s # => "--boundary\r\nContent-Disposition: form-data; name=\"foo\"\r\n\r\nbar\r\n--boundary--"
