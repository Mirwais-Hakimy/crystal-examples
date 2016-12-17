# object.cr:182
str = "hello"
str.itself.object_id == str.object_id # => true
