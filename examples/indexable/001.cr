# indexable.cr:31
a = [:foo, :bar]
a.fetch(0) { :default_value }    # => :foo
a.fetch(2) { :default_value }    # => :default_value
a.fetch(2) { |index| index * 3 } # => 6
