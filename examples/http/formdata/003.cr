# http/formdata.cr:82
require "http"
form_data = "--aA40\r\nContent-Disposition: form-data; name=\"field1\"\r\n\r\nfield data\r\n--aA40--"
HTTP::FormData.parse(IO::Memory.new(form_data), "aA40") do |part|
  part.name             # => "field1"
  part.body.gets_to_end # => "field data"
end
