# csv.cr: 7 examples
require "csv"

# csv.cr:33 (001.cr)
require "csv"

csv = CSV.new("Name, Age\nJohn, 20\nPeter, 30", headers: true)
csv.next # => true

csv["Name"]  # => "John"
csv[0]       # => "John"
csv[-2]      # => "John"
csv[/name/i] # => "John"

csv["Age"] # => " 20"

csv.row.to_a # => ["John", " 20"]
csv.row.to_h # => {"Name" => "John", "Age" => " 20"}

csv.next    # => true
csv["Name"] # => "Peter"

csv.next # => false

# csv.cr:67 (002.cr)
CSV.parse("one,two\nthree")
# => [["one", "two"], ["three"]]
CSV.parse("one;two\n'three;'", separator: ';', quote_char: '\'')
# => [["one", "two"], ["three;"]]

# csv.cr:81 (003.cr)
CSV.each_row("one,two\nthree") do |row|
  puts row
end

# csv.cr:89 (004.cr)
["one", "two"]
["three"]

# csv.cr:103 (005.cr)
rows = CSV.each_row("one,two\nthree")
rows.next # => ["one", "two"]
rows.next # => ["three"]

# csv.cr:116 (006.cr)
result = CSV.build do |csv|
  csv.row "one", "two"
  csv.row "three"
end
result # => "one,two\nthree\n"
result = CSV.build(quoting: CSV::Builder::Quoting::ALL) do |csv|
  csv.row "one", "two"
  csv.row "three"
end
result # => "\"one\",\"two\"\n\"three\"\n"

# csv.cr:139 (007.cr)
io = IO::Memory.new
io.puts "HEADER"
CSV.build(io) do |csv|
  csv.row "one", "two"
  csv.row "three"
end
io.to_s # => "HEADER\none,two\nthree\n"
