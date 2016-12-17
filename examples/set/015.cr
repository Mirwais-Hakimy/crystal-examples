# set.cr:222
Set{1, 2, 3, 4, 5} ^ Set{2, 4, 6}            # => Set{1, 3, 5, 6}
Set{'a', 'b', 'b', 'z'} ^ Set{'a', 'b', 'c'} # => Set{'z', 'c'}
