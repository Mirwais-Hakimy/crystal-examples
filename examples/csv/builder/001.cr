# csv/builder.cr:5
require "csv"

result = CSV.build do |csv|
  # A row can be written by specifying several values
  csv.row "Hello", 1, 'a', "String with \"quotes\"", '"', :sym

  # Or an enumerable
  csv.row [1, 2, 3]

  # Or using a block, and appending to the row
  csv.row do |row|
    # Appending a single value
    row << 4

    # Or multiple values
    row.concat 5, 6

    # Or an enumerable
    row.concat [7, 8]
  end
end
puts result
