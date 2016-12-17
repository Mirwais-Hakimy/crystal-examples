# enumerable.cr:1068
[1, false, false].one? # => true
[1, false, 3].one?     # => false
[1].one?               # => true
[false].one?           # => false
