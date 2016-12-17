# set.cr:259
Set{'a', 'b', 'b', 'z'}.subtract Set{'a', 'b', 'c'} # => Set{'z'}
Set{1, 2, 3, 4, 5}.subtract [2, 4, 6]               # => Set{1, 3, 5}
