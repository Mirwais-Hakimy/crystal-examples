# array.cr:1662
a = %w(apple pear fig)
b = a.sort_by { |word| word.size }
b # => ["fig", "pear", "apple"]
a # => ["apple", "pear", "fig"]
