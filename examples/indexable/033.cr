# indexable.cr:655
a = [1, 2, 3]
b = ["a", "b"]

a.zip?(b) { |x, y| puts "#{x} -- #{y}" }
