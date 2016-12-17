# iterator.cr:9
(1..10_000_000).select(&.even?).map { |x| x * 3 }.first(3) # => [6, 12, 18]
