# http/multipart/builder.cr:27
require "http"
io = IO::Memory.new # This is a stub. Actually, any IO can be used.
builder = HTTP::Multipart::Builder.new(io, "a4VF")
builder.content_type("mixed") # => "multipart/mixed; boundary=\"a4VF\""
