# regex.cr:388
a = "HELLO"
b = case a
    when /^[a-z]*$/
      "Lower case"
    when /^[A-Z]*$/
      "Upper case"
    else
      "Mixed case"
    end
b # => "Upper case"
