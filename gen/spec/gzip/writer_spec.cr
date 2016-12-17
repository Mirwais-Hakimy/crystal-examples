require "spec"
require "gzip"
it "gzip/writer.cr" do
puts # :nocode:

puts "# gzip/writer.cr:11 (001.cr)" # :nocode: :example:
# require "gzip"

File.write("file.txt", "abc")

File.open("./file.txt", "r") do |input_file|
  File.open("./file.gzip", "w") do |output_file|
    Gzip::Writer.open(output_file) do |gzip|
      IO.copy(input_file, gzip)
    end
  end
end


end
