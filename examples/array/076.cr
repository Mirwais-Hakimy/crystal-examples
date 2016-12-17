# array.cr:1783
a = [{"student", "sam"}, {"student", "george"}, {"teacher", "matz"}]
a.uniq { |s| s[0] } # => [{"student", "sam"}, {"teacher", "matz"}]
a                   # => [{"student", "sam"}, {"student", "george"}, {"teacher", "matz"}]
