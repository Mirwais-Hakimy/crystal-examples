# http/formdata/builder.cr:26
require "http"
builder = HTTP::FormData::Builder.new(io, "a4VF")
builder.content_type # => "multipart/form-data; boundary=\"a4VF\""
