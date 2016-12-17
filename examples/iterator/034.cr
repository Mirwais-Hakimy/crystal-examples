# iterator.cr:1245
iter1 = [4, 5, 6].each
iter2 = [7, 8, 9].each
iter = iter1.zip(iter2)
iter.next # => {4, 7}
iter.next # => {5, 8}
iter.next # => {6, 9}
iter.next # => Iterator::Stop::INSTANCE
