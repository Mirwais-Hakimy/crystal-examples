# iterable.cr: 1 examples

# iterable.cr:20 (001.cr)
(0..7).chunk(&./(3)).to_a # => [{0, [0, 1, 2]}, {1, [3, 4, 5]}, {2, [6, 7]}]
