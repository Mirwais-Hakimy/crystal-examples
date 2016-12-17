# tuple.cr: 28 examples

# tuple.cr:9 (001.cr)
tuple = {1, "hello", 'x'} # Tuple(Int32, String, Char)
tuple[0]                  # => 1
tuple[1]                  # => "hello"
tuple[2]                  # => 'x'

# tuple.cr:29 (002.cr)
def one_and_hello
  {1, "hello"}
end

one, hello = one_and_hello
one   # => 1
hello # => "hello"

# tuple.cr:43 (003.cr)
def multiply(string, value)
  string * value
end

tuple = {"hey", 2}
value = multiply(*tuple) # same as multiply tuple[0], tuple[1]
value                    # => "heyhey"

# tuple.cr:56 (004.cr)
def splat_test(*args)
  args
end

tuple = splat_test 1, "hello", 'x'
tuple.class # => Tuple(Int32, String, Char)
tuple       # => {1, "hello", 'x'}

# tuple.cr:74 (005.cr)
Tuple.new(1, "hello", 'x') #=> {1, "hello", 'x'}
Tuple.new                  #=> {}

# {}                         # syntax error

# tuple.cr:86 (006.cr)
# pending by 'file:pendings/tuple/006.cr'
# Tuple(String, Int64).from(["world", 2])       # => {"world", 2}
# Tuple(String, Int64).from(["world", 2]).class # => {String, Int64}

# tuple.cr:103 (007.cr)
# pending by 'file:pendings/tuple/007.cr'
# def speak_about(thing : String, n : Int64)
#   "I see #{n} #{thing}s"
# end
# 
# data = JSON.parse(%(["world", 2])).as_a
# speak_about(*{String, Int64}.from(data)) # => "I see 2 worlds"

# tuple.cr:132 (008.cr)
tuple = {1, "hello", 'x'}
tuple[0] # => 1 (Int32)
# tuple[3] # compile error: index out of bounds for tuple {Int32, String, Char}

i = 0
tuple[i] # => 1 (Int32 | String | Char)

i = 3
# tuple[i] # raises IndexError

# tuple.cr:149 (009.cr)
tuple = {1, "hello", 'x'}
tuple[0]? # => 1
tuple[3]? # => nil

# tuple.cr:160 (010.cr)
tuple = {1, "hello", 'x'}
tuple.at(0) # => 1
# tuple.at(3) # raises IndexError

# tuple.cr:172 (011.cr)
tuple = {1, "hello", 'x'}
tuple.at(0) { 10 } # => 1
tuple.at(3) { 10 } # => 10

# tuple.cr:187 (012.cr)
tuple = {1, "hello", 'x'}
tuple.each do |value|
  puts value
end

# tuple.cr:210 (013.cr)
t1 = {1, "hello"}
t2 = {1.0, "hello"}
t3 = {2, "hello"}

t1 == t2 # => true
t1 == t3 # => false

# tuple.cr:241 (014.cr)
{1, 2} === {1, 2} # => true
{1, 2} === {1, 3} # => false

# tuple.cr:257 (015.cr)
{1, 2} === {1, 2, 3}             # => false
{/o+/, "bar"} === {"foo", "bar"} # => true

# tuple.cr:285 (016.cr)
{"a", "a", "c"} <=> {"a", "b", "c"} # => -1
{1, 2, 3, 4, 5, 6} <=> {1, 2}       # => +1
{1, 2} <=> {1, 2.0}                 # => 0

# tuple.cr:331 (017.cr)
t1 = {1, 2}
t2 = {"foo", "bar"}
t3 = t1 + t2
t3         # => {1, 2, "foo", "bar"}
typeof(t3) # => Tuple(Int32, Int32, String, String)

# tuple.cr:357 (018.cr)
{'a', 'b'}.size # => 2

# tuple.cr:366 (019.cr)
tuple = {1, "hello", 'x'}
tuple.class.types # => {Int32, String, Char}

# tuple.cr:381 (020.cr)
tuple = {1, "hello"}
tuple.to_s # => "{1, \"hello\"}"

# tuple.cr:397 (021.cr)
tuple = {1, 2.5, "a"}
tuple.map &.to_s # => {"1", "2.5", "a"}

# tuple.cr:413 (022.cr)
tuple = {1, 2.5, "a"}
tuple.map_with_index { |e, i| "tuple[#{i}]: #{e}" } # => {"tuple[0]: 1", "tuple[1]: 2.5", "tuple[2]: a"}

# tuple.cr:429 (023.cr)
tuple = {1, 2.5, "a"}
tuple.reverse # => {"a", 2.5, 1}

# tuple.cr:445 (024.cr)
tuple = {1, "hello", 'x'}
tuple.reverse_each do |value|
  puts value
end

# tuple.cr:469 (025.cr)
tuple = {1, 2.5}
tuple.first # => 1

# tuple.cr:480 (026.cr)
tuple = {1, 2.5}
tuple.first? # => 1

empty = Tuple.new
empty.first? # => nil

# tuple.cr:498 (027.cr)
tuple = {1, 2.5}
tuple.last # => 2.5

# tuple.cr:511 (028.cr)
tuple = {1, 2.5}
tuple.last? # => 2.5

empty = Tuple.new
empty.last? # => nil
