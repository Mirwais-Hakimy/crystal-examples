# set.cr:161
Set{1, 1, 3, 5} & Set{1, 2, 3}               # => Set{1, 3}
Set{'a', 'b', 'b', 'z'} & Set{'a', 'b', 'c'} # => Set{'a', 'b'}
