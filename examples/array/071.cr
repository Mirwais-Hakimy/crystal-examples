# array.cr:1676
a = %w(apple pear fig)
a.sort_by! { |word| word.size }
a # => ["fig", "pear", "apple"]
