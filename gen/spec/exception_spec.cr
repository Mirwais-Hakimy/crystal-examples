require "spec"

it "exception.cr" do
puts # :nocode:

puts "# exception.cr:74 (001.cr)" # :nocode: :example:
a = [:foo, :bar]
expect_raises(IndexError) { a[2] }

puts "# exception.cr:86 (002.cr)" # :nocode: :example:
expect_raises(ArgumentError) { [1, 2, 3].first(-4) }

puts "# exception.cr:97 (003.cr)" # :nocode: :example:
expect_raises(TypeCastError) { [1, "hi"][1].as(Int32) }

puts "# exception.cr:114 (004.cr)" # :nocode: :example:
h = {"foo" => "bar"}
expect_raises(KeyError) { h["baz"] }

puts "# exception.cr:123 (005.cr)" # :nocode: :example:
expect_raises(DivisionByZeroError) { 1 / 0 }


end
