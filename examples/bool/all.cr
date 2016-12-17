# bool.cr: 4 examples

# bool.cr:3 (001.cr)
true  # A Bool that is true
false # A Bool that is false

# bool.cr:10 (002.cr)
false | false # => false
false | true  # => true
true | false  # => true
true | true   # => true

# bool.cr:22 (003.cr)
false & false # => false
false & true  # => false
true & false  # => false
true & true   # => true

# bool.cr:34 (004.cr)
false ^ false # => false
false ^ true  # => true
true ^ false  # => true
true ^ true   # => false
