# gzip/writer.cr: 1 examples
require "gzip"

# gzip/writer.cr:11 (001.cr)
require "gzip"

File.write("file.txt", "abc")

File.open("./file.txt", "r") do |input_file|
  File.open("./file.gzip", "w") do |output_file|
    Gzip::Writer.open(output_file) do |gzip|
      IO.copy(input_file, gzip)
    end
  end
end
