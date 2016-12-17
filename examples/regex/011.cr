# regex.cr:180
/asdf/ =~ "ASDF"    # => nil
/asdf/i =~ "ASDF"   # => 0
/^z/i =~ "ASDF\nZ"  # => nil
/^z/im =~ "ASDF\nZ" # => 5
