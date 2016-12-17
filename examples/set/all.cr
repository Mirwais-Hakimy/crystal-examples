# set.cr: 25 examples

# set.cr:12 (001.cr)
s1 = Set{1, 2}
s2 = [1, 2].to_set
s3 = Set.new [1, 2]
s1 == s2 # => true
s1 == s3 # => true
s1.add(2)
s1.concat([6, 8])
s1.subset? s2 # => false
s2.subset? s1 # => true

# set.cr:29 (002.cr)
s = Set(Int32).new
s.empty? # => true

# set.cr:47 (003.cr)
a = [1, 3, 5]
s = Set.new a
s.empty? # => false

# set.cr:63 (004.cr)
s = Set{1, 5}
s.includes? 8 # => false
s << 8
s.includes? 8 # => true

# set.cr:76 (005.cr)
s = Set{1, 5}
s.concat [5, 5, 8, 9]
s.size # => 4

# set.cr:90 (006.cr)
s = Set{1, 5}
s.includes? 5 # => true
s.includes? 9 # => false

# set.cr:101 (007.cr)
s = Set{1, 5}
s.includes? 5 # => true
s.delete 5
s.includes? 5 # => false

# set.cr:114 (008.cr)
s = Set{1, 5}
s.size # => 2

# set.cr:124 (009.cr)
s = Set{1, 5}
s.size # => 2
s.clear
s.size # => 0

# set.cr:137 (010.cr)
s = Set(Int32).new
s.empty? # => true
s << 3
s.empty? # => false

# set.cr:161 (011.cr)
Set{1, 1, 3, 5} & Set{1, 2, 3}               # => Set{1, 3}
Set{'a', 'b', 'b', 'z'} & Set{'a', 'b', 'c'} # => Set{'a', 'b'}

# set.cr:180 (012.cr)
Set{1, 1, 3, 5} | Set{1, 2, 3}               # => Set{1, 3, 5, 2}
Set{'a', 'b', 'b', 'z'} | Set{'a', 'b', 'c'} # => Set{'a', 'b', 'z', 'c'}

# set.cr:196 (013.cr)
Set{1, 2, 3, 4, 5} - Set{2, 4}               # => Set{1, 3, 5}
Set{'a', 'b', 'b', 'z'} - Set{'a', 'b', 'c'} # => Set{'z'}

# set.cr:211 (014.cr)
Set{1, 2, 3, 4, 5} - [2, 4]               # => Set{1, 3, 5}
Set{'a', 'b', 'b', 'z'} - ['a', 'b', 'c'] # => Set{'z'}

# set.cr:222 (015.cr)
Set{1, 2, 3, 4, 5} ^ Set{2, 4, 6}            # => Set{1, 3, 5, 6}
Set{'a', 'b', 'b', 'z'} ^ Set{'a', 'b', 'c'} # => Set{'z', 'c'}

# set.cr:240 (016.cr)
Set{1, 2, 3, 4, 5} ^ [2, 4, 6]            # => Set{1, 3, 5, 6}
Set{'a', 'b', 'b', 'z'} ^ ['a', 'b', 'c'] # => Set{'z', 'c'}

# set.cr:259 (017.cr)
Set{'a', 'b', 'b', 'z'}.subtract Set{'a', 'b', 'c'} # => Set{'z'}
Set{1, 2, 3, 4, 5}.subtract [2, 4, 6]               # => Set{1, 3, 5}

# set.cr:272 (018.cr)
Set{1, 5} == Set{1, 5} # => true

# set.cr:283 (019.cr)
red_like = Set{"red", "pink", "violet"}
blue_like = Set{"blue", "azure", "violet"}

case "violet"
when red_like & blue_like
  puts "red & blue like color!"
when red_like
  puts "red like color!"
when blue_like
  puts "blue like color!"
end

# set.cr:318 (020.cr)
Set{1, 5}.to_a # => [1,5]

# set.cr:340 (021.cr)
Set{1, 2, 3}.intersects? Set{4, 5} # => false
Set{1, 2, 3}.intersects? Set{3, 4} # => true

# set.cr:364 (022.cr)
Set{1, 5}.subset? Set{1, 3, 5}    # => true
Set{1, 3, 5}.subset? Set{1, 3, 5} # => true

# set.cr:378 (023.cr)
Set{1, 5}.proper_subset? Set{1, 3, 5}    # => true
Set{1, 3, 5}.proper_subset? Set{1, 3, 5} # => false

# set.cr:392 (024.cr)
Set{1, 3, 5}.superset? Set{1, 5}    # => true
Set{1, 3, 5}.superset? Set{1, 3, 5} # => true

# set.cr:405 (025.cr)
Set{1, 3, 5}.proper_superset? Set{1, 5}    # => true
Set{1, 3, 5}.proper_superset? Set{1, 3, 5} # => false
