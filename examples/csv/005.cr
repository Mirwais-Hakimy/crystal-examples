# csv.cr:103
require "csv"
rows = CSV.each_row("one,two\nthree")
rows.next # => ["one", "two"]
rows.next # => ["three"]
