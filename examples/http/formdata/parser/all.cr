# http/formdata/parser.cr: 1 examples
require "http"

# http/formdata/parser.cr:17 (001.cr)
form_data = "--aA40\r\nContent-Disposition: form-data; name=\"field1\"; filename=\"foo.txt\"; size=13\r\nContent-Type: text/plain\r\n\r\nfield data\r\n--aA40--"
parser = HTTP::FormData::Parser.new(IO::Memory.new(form_data), "aA40")
parser.next do |part|
  part.name                    # => "field1"
  part.body.gets_to_end        # => "field data"
  part.filename                # => "foo.txt"
  part.size                    # => 13
  part.headers["Content-Type"] # => "text/plain"
end
