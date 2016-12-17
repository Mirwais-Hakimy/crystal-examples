# enumerable.cr:686
[1, 2, 3, 4, 5].join(", ", STDOUT) { |i, io| io << "(#{i})" }
