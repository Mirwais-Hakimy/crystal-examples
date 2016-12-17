# regex.cr:375
/abc/ == /abc/i  # => false
/abc/i == /ABC/i # => false
/abc/i == /abc/i # => true
