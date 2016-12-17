# regex.cr:496
/(.)/.name_table                         # => {}
/(?<foo>.)/.name_table                   # => {1 => "foo"}
/(?<foo>.)(?<bar>.)/.name_table          # => {2 => "bar", 1 => "foo"}
/(.)(?<foo>.)(.)(?<bar>.)(.)/.name_table # => {4 => "bar", 2 => "foo"}
