# range.cr:201
(1..10).includes?(4)  # => true
(1..10).includes?(10) # => true
(1..10).includes?(11) # => false

(1...10).includes?(9)  # => true
(1...10).includes?(10) # => false
