require "spec"
require "http"
it "http/formdata/builder.cr" do
puts # :nocode:

puts "# http/formdata/builder.cr:6 (001.cr)" # :nocode: :example:
io = IO::Memory.new
builder = HTTP::FormData::Builder.new(io, "aA47")
builder.field("name", "joe")
file = IO::Memory.new("file contents")
builder.file("upload", file, HTTP::FormData::FileMetadata.new(filename: "test.txt"))
builder.finish
( io.to_s ).to_s.should eq( "--aA47\r\nContent-Disposition: form-data; name=\"name\"\r\n\r\njoe\r\n--aA47\r\nContent-Disposition: form-data; name=\"upload\"; filename=\"test.txt\"\r\n\r\nfile contents\r\n--aA47--" )

puts "# http/formdata/builder.cr:26 (002.cr)" # :nocode: :example:
builder = HTTP::FormData::Builder.new(io, "a4VF")
( builder.content_type ).to_s.should eq( "multipart/form-data; boundary=\"a4VF\"" )


end
