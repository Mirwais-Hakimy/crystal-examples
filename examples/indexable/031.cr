# indexable.cr:613
a = [1, 2, 3]
b = ["a", "b", "c"]

a.zip(b) { |x, y| puts "#{x} -- #{y}" }
