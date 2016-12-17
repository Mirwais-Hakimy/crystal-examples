# csv.cr:116
require "csv"
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
