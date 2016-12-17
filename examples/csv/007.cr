# csv.cr:139
require "csv"
io = IO::Memory.new
io.puts "HEADER"
CSV.build(io) do |csv|
  csv.row "one", "two"
  csv.row "three"
end
io.to_s # => "HEADER\none,two\nthree\n"
