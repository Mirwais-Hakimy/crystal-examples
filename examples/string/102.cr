# string.cr:2960
old_pond = "
  Old pond
  a frog leaps in
  water's sound
"
old_pond.split    # => ["Old", "pond", "a", "frog", "leaps", "in", "water's", "sound"]
old_pond.split(3) # => ["Old", "pond", "a frog leaps in\n  water's sound\n"]
