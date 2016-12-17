# indexable.cr:297
array = ["a", "b", "c", "d", "e"]
array.each_index(start: -3, count: 2) { |x| print x, " -- " }
