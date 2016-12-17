# csv.cr:67
require "csv"
CSV.parse("one,two\nthree")
# => [["one", "two"], ["three"]]
CSV.parse("one;two\n'three;'", separator: ';', quote_char: '\'')
# => [["one", "two"], ["three;"]]
