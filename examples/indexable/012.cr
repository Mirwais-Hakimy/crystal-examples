# indexable.cr:237
array = ["a", "b", "c", "d", "e"]
array.each(within: 1..3) { |x| print x, " -- " }
