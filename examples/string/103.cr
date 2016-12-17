# string.cr:2983
ary = [] of String
old_pond = "
  Old pond
  a frog leaps in
  water's sound
"

old_pond.split { |s| ary << s }
ary # => ["Old", "pond", "a", "frog", "leaps", "in", "water's", "sound"]
ary.clear

old_pond.split(3) { |s| ary << s }
ary # => ["Old", "pond", "a frog leaps in\n  water's sound\n"]
