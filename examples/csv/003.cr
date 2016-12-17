# csv.cr:81
require "csv"
CSV.each_row("one,two\nthree") do |row|
  puts row
end
