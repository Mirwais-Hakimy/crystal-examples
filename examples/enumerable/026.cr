# enumerable.cr:592
["Anna", "Ary", "Alice"].index_by { |e| e.size }
# => {4 => "Anna", 3 => "Ary", 5 => "Alice"}
["Anna", "Ary", "Alice", "Bob"].index_by { |e| e.size }
# => {4 => "Anna", 3 => "Bob", 5 => "Alice"}
