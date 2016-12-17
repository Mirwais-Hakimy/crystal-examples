# set.cr:12
s1 = Set{1, 2}
s2 = [1, 2].to_set
s3 = Set.new [1, 2]
s1 == s2 # => true
s1 == s3 # => true
s1.add(2)
s1.concat([6, 8])
s1.subset? s2 # => false
s2.subset? s1 # => true
