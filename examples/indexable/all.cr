# indexable.cr: 34 examples

# indexable.cr:31 (001.cr)
a = [:foo, :bar]
a.fetch(0) { :default_value }    # => :foo
a.fetch(2) { :default_value }    # => :default_value
a.fetch(2) { |index| index * 3 } # => 6

# indexable.cr:46 (002.cr)
a = [:foo, :bar]
a.fetch(0, :default_value) # => :foo
a.fetch(2, :default_value) # => :default_value

# indexable.cr:61 (003.cr)
ary = ['a', 'b', 'c']
ary[0]  # => 'a'
ary[2]  # => 'c'
ary[-1] # => 'c'
ary[-2] # => 'b'

# ary[3]  # raises IndexError
# ary[-4] # raises IndexError

# indexable.cr:81 (004.cr)
ary = ['a', 'b', 'c']
ary[0]?  # => 'a'
ary[2]?  # => 'c'
ary[-1]? # => 'c'
ary[-2]? # => 'b'

ary[3]?  # nil
ary[-4]? # nil

# indexable.cr:99 (005.cr)
ary = [{1, 2, 3, {4, 5, 6}}]
ary.dig?(0, 3, 2) # => 6
ary.dig?(0, 3, 3) # => nil

# indexable.cr:118 (006.cr)
ary = [{1, 2, 3, {4, 5, 6}}]
ary.dig(0, 3, 2) # => 6
# ary.dig(0, 3, 3) # raises IndexError

# indexable.cr:146 (007.cr)
[2, 5, 7, 10].bsearch { |x| x >= 4 } # => 5
[2, 5, 7, 10].bsearch { |x| x > 10 } # => nil

# indexable.cr:165 (008.cr)
[2, 5, 7, 10].bsearch_index { |x, i| x >= 4 } # => 1
[2, 5, 7, 10].bsearch_index { |x, i| x > 10 } # => nil

# indexable.cr:176 (009.cr)
a = ["a", "b", "c"]
a.each { |x| print x, " -- " }

# indexable.cr:194 (010.cr)
a = ["a", "b", "c"]
iter = a.each
iter.next # => "a"
iter.next # => "b"

# indexable.cr:216 (011.cr)
array = ["a", "b", "c", "d", "e"]
array.each(start: 1, count: 3) { |x| print x, " -- " }

# indexable.cr:237 (012.cr)
array = ["a", "b", "c", "d", "e"]
array.each(within: 1..3) { |x| print x, " -- " }

# indexable.cr:255 (013.cr)
a = ["a", "b", "c"]
a.each_index { |x| print x, " -- " }

# indexable.cr:275 (014.cr)
a = ["a", "b", "c"]
iter = a.each_index
iter.next # => 0
iter.next # => 1

# indexable.cr:297 (015.cr)
array = ["a", "b", "c", "d", "e"]
array.each_index(start: -3, count: 2) { |x| print x, " -- " }

# indexable.cr:388 (016.cr)
{1, 2, 3}.to_a # => [1, 2, 3]

# indexable.cr:399 (017.cr)
([] of Int32).empty? # => true
([1]).empty?         # => false

# indexable.cr:423 (018.cr)
a = [1, 2, 3]
b = ["a", "ab", "abc"]
a.equals?(b) { |x, y| x == y.size } # => true
a.equals?(b) { |x, y| x == y }      # => false

# indexable.cr:439 (019.cr)
([1, 2, 3]).first   # => 1
# ([] of Int32).first # raises IndexError

# indexable.cr:449 (020.cr)
([1, 2, 3]).first { 4 }   # => 1
([] of Int32).first { 4 } # => 4

# indexable.cr:459 (021.cr)
([1, 2, 3]).first?   # => 1
([] of Int32).first? # => nil

# indexable.cr:479 (022.cr)
[1, 2, 3, 1, 2, 3].index(2, offset: 2) # => 4

# indexable.cr:490 (023.cr)
[1, 2, 3, 1, 2, 3].index(offset: 2) { |x| x < 2 } # => 3

# indexable.cr:507 (024.cr)
([1, 2, 3]).last   # => 3
# ([] of Int32).last # raises IndexError

# indexable.cr:517 (025.cr)
([1, 2, 3]).last { 4 }   # => 3
([] of Int32).last { 4 } # => 4

# indexable.cr:527 (026.cr)
([1, 2, 3]).last?   # => 3
([] of Int32).last? # => nil

# indexable.cr:553 (027.cr)
[1, 2, 3, 2, 3].rindex(2)            # => 3
[1, 2, 3, 2, 3].rindex(2, offset: 2) # => 1

# indexable.cr:568 (028.cr)
[1, 2, 3, 2, 3].rindex { |x| x < 3 }            # => 3
[1, 2, 3, 2, 3].rindex(offset: 2) { |x| x < 3 } # => 1

# indexable.cr:587 (029.cr)
a = [1, 2, 3]
a.sample                # => 2
a.sample                # => 1
a.sample(Random.new(1)) # => 3

# indexable.cr:601 (030.cr)
["a", "b", "c", "d"].values_at(0, 2) # => {"a", "c"}

# indexable.cr:613 (031.cr)
a = [1, 2, 3]
b = ["a", "b", "c"]

a.zip(b) { |x, y| puts "#{x} -- #{y}" }

# indexable.cr:638 (032.cr)
a = [1, 2, 3]
b = ["a", "b", "c"]

a.zip(b) # => [{1, "a"}, {2, "b"}, {3, "c"}]

# indexable.cr:655 (033.cr)
a = [1, 2, 3]
b = ["a", "b"]

a.zip?(b) { |x, y| puts "#{x} -- #{y}" }

# indexable.cr:680 (034.cr)
a = [1, 2, 3]
b = ["a", "b"]

a.zip?(b) # => [{1, "a"}, {2, "b"}, {3, nil}]
