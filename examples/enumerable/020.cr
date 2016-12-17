# enumerable.cr:494
["Alice", "Bob", "Ary"].group_by { |name| name.size } # => {5 => ["Alice"], 3 => ["Bob", "Ary"]}
