# enum.cr:409
Color.parse?("Red")    # => Color::Red
Color.parse?("BLUE")   # => Color::Blue
Color.parse?("Yellow") # => nil
