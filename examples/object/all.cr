# object.cr: 72 examples

# object.cr:28 (001.cr)
case value
when x
  # something when x
when y
  # something when y
end

# object.cr:39 (002.cr)
if x === value
  # something when x
elsif y === value
  # something when y
end

# object.cr:67 (003.cr)
def hash(hasher)
  hasher = @some_ivar.hash(hasher)
  hasher = @some_other_ivar.hash(hasher)
  hasher
end

# object.cr:151 (004.cr)
(1..10).tap { |x| puts "original: #{x.inspect}" }
  .to_a.tap { |x| puts "array: #{x.inspect}" }
  .select { |x| x % 2 == 0 }.tap { |x| puts "evens: #{x.inspect}" }
  .map { |x| x*x }.tap { |x| puts "squares: #{x.inspect}" }

# object.cr:167 (005.cr)
# First program argument in downcase, or nil
ARGV[0]?.try &.downcase

# object.cr:182 (006.cr)
str = "hello"
str.itself.object_id == str.object_id # => true

# object.cr:207 (007.cr)
0x01020304.unsafe_as(StaticArray(UInt8, 4)) # => StaticArray[4, 3, 2, 1]

# object.cr:213 (008.cr)
1.234_f64.unsafe_as(Int64) # => 4608236261112822104

# object.cr:241 (009.cr)
class Person
  {{macro_prefix}}getter name
end

# object.cr:249 (010.cr)
class Person
  def {{method_prefix}}name
    {{var_prefix}}name
  end
end

# object.cr:259 (011.cr)
class Person
  {{macro_prefix}}getter :name, "age"
end

# object.cr:268 (012.cr)
class Person
  {{macro_prefix}}getter name : String
end

# object.cr:276 (013.cr)
class Person
  {{var_prefix}}name : String

  def {{method_prefix}}name : String
    {{var_prefix}}name
  end
end

# object.cr:288 (014.cr)
class Person
  {{macro_prefix}}getter name : String = "John Doe"
end

# object.cr:296 (015.cr)
class Person
  {{var_prefix}}name : String = "John Doe"

  def {{method_prefix}}name : String
    {{var_prefix}}name
  end
end

# object.cr:309 (016.cr)
class Person
  {{macro_prefix}}getter name = "John Doe"
end

# object.cr:317 (017.cr)
class Person
  {{var_prefix}}name = "John Doe"

  def {{method_prefix}}name : String
    {{var_prefix}}name
  end
end

# object.cr:331 (018.cr)
class Person
  {{macro_prefix}}getter(birth_date) { Time.now }
end

# object.cr:339 (019.cr)
class Person
  def {{method_prefix}}birth_date
    {{var_prefix}}birth_date ||= Time.now
  end
end

# object.cr:392 (020.cr)
class Person
  {{macro_prefix}}getter! name
end

# object.cr:400 (021.cr)
class Person
  def {{method_prefix}}name?
    {{var_prefix}}name
  end

  def {{method_prefix}}name
    {{var_prefix}}name.not_nil!
  end
end

# object.cr:414 (022.cr)
class Person
  {{macro_prefix}}getter! :name, "age"
end

# object.cr:423 (023.cr)
class Person
  {{macro_prefix}}getter! name : String
end

# object.cr:431 (024.cr)
class Person
  {{var_prefix}}name : String?

  def {{method_prefix}}name?
    {{var_prefix}}name
  end

  def {{method_prefix}}name
    {{var_prefix}}name.not_nil!
  end
end

# object.cr:465 (025.cr)
class Person
  {{macro_prefix}}getter? happy
end

# object.cr:473 (026.cr)
class Person
  def {{method_prefix}}happy?
    {{var_prefix}}happy
  end
end

# object.cr:483 (027.cr)
class Person
  {{macro_prefix}}getter? :happy, "famous"
end

# object.cr:492 (028.cr)
class Person
  {{macro_prefix}}getter? happy : Bool
end

# object.cr:500 (029.cr)
class Person
  {{var_prefix}}happy : Bool

  def {{method_prefix}}happy? : Bool
    {{var_prefix}}happy
  end
end

# object.cr:512 (030.cr)
class Person
  {{macro_prefix}}getter? happy : Bool = true
end

# object.cr:520 (031.cr)
class Person
  {{var_prefix}}happy : Bool = true

  def {{method_prefix}}happy? : Bool
    {{var_prefix}}happy
  end
end

# object.cr:533 (032.cr)
class Person
  {{macro_prefix}}getter? happy = true
end

# object.cr:541 (033.cr)
class Person
  {{var_prefix}}happy = true

  def {{method_prefix}}happy?
    {{var_prefix}}happy
  end
end

# object.cr:576 (034.cr)
class Person
  {{macro_prefix}}setter name
end

# object.cr:584 (035.cr)
class Person
  def {{method_prefix}}name=({{var_prefix}}name)
  end
end

# object.cr:593 (036.cr)
class Person
  {{macro_prefix}}setter :name, "age"
end

# object.cr:602 (037.cr)
class Person
  {{macro_prefix}}setter name : String
end

# object.cr:610 (038.cr)
class Person
  {{var_prefix}}name : String

  def {{method_prefix}}name=({{var_prefix}}name : String)
  end
end

# object.cr:621 (039.cr)
class Person
  {{macro_prefix}}setter name : String = "John Doe"
end

# object.cr:629 (040.cr)
class Person
  {{var_prefix}}name : String = "John Doe"

  def {{method_prefix}}name=({{var_prefix}}name : String)
  end
end

# object.cr:641 (041.cr)
class Person
  {{macro_prefix}}setter name = "John Doe"
end

# object.cr:649 (042.cr)
class Person
  {{var_prefix}}name = "John Doe"

  def {{method_prefix}}name=({{var_prefix}}name)
  end
end

# object.cr:680 (043.cr)
class Person
  {{macro_prefix}}property name
end

# object.cr:688 (044.cr)
class Person
  def {{method_prefix}}name=({{var_prefix}}name)
  end

  def {{method_prefix}}name
    {{var_prefix}}name
  end
end

# object.cr:701 (045.cr)
class Person
  {{macro_prefix}}property :name, "age"
end

# object.cr:710 (046.cr)
class Person
  {{macro_prefix}}property name : String
end

# object.cr:718 (047.cr)
class Person
  {{var_prefix}}name : String

  def {{method_prefix}}name=({{var_prefix}}name)
  end

  def {{method_prefix}}name
    {{var_prefix}}name
  end
end

# object.cr:733 (048.cr)
class Person
  {{macro_prefix}}property name : String = "John Doe"
end

# object.cr:741 (049.cr)
class Person
  {{var_prefix}}name : String = "John Doe"

  def {{method_prefix}}name=({{var_prefix}}name : String)
  end

  def {{method_prefix}}name
    {{var_prefix}}name
  end
end

# object.cr:757 (050.cr)
class Person
  {{macro_prefix}}property name = "John Doe"
end

# object.cr:765 (051.cr)
class Person
  {{var_prefix}}name = "John Doe"

  def {{method_prefix}}name=({{var_prefix}}name : String)
  end

  def {{method_prefix}}name
    {{var_prefix}}name
  end
end

# object.cr:782 (052.cr)
class Person
  {{macro_prefix}}property(birth_date) { Time.now }
end

# object.cr:790 (053.cr)
class Person
  def {{method_prefix}}birth_date
    {{var_prefix}}birth_date ||= Time.now
  end

  def {{method_prefix}}birth_date=({{var_prefix}}birth_date)
  end
end

# object.cr:857 (054.cr)
class Person
  {{macro_prefix}}property! name
end

# object.cr:865 (055.cr)
class Person
  def {{method_prefix}}name=({{var_prefix}}name)
  end

  def {{method_prefix}}name?
    {{var_prefix}}name
  end

  def {{method_prefix}}name
    {{var_prefix}}name.not_nil!
  end
end

# object.cr:882 (056.cr)
class Person
  {{macro_prefix}}property! :name, "age"
end

# object.cr:891 (057.cr)
class Person
  {{macro_prefix}}property! name : String
end

# object.cr:899 (058.cr)
class Person
  {{var_prefix}}name : String?

  def {{method_prefix}}name=({{var_prefix}}name)
  end

  def {{method_prefix}}name?
    {{var_prefix}}name
  end

  def {{method_prefix}}name
    {{var_prefix}}name.not_nil!
  end
end

# object.cr:933 (059.cr)
class Person
  {{macro_prefix}}property? happy
end

# object.cr:941 (060.cr)
class Person
  def {{method_prefix}}happy=({{var_prefix}}happy)
  end

  def {{method_prefix}}happy?
    {{var_prefix}}happy
  end
end

# object.cr:954 (061.cr)
class Person
  {{macro_prefix}}property? :happy, "famous"
end

# object.cr:963 (062.cr)
class Person
  {{macro_prefix}}property? happy : Bool
end

# object.cr:971 (063.cr)
class Person
  {{var_prefix}}happy : Bool

  def {{method_prefix}}happy=({{var_prefix}}happy : Bool)
  end

  def {{method_prefix}}happy? : Bool
    {{var_prefix}}happy
  end
end

# object.cr:986 (064.cr)
class Person
  {{macro_prefix}}property? happy : Bool = true
end

# object.cr:994 (065.cr)
class Person
  {{var_prefix}}happy : Bool = true

  def {{method_prefix}}happy=({{var_prefix}}happy : Bool)
  end

  def {{method_prefix}}happy? : Bool
    {{var_prefix}}happy
  end
end

# object.cr:1010 (066.cr)
class Person
  {{macro_prefix}}property? happy = true
end

# object.cr:1018 (067.cr)
class Person
  {{var_prefix}}happy = true

  def {{method_prefix}}happy=({{var_prefix}}happy)
  end

  def {{method_prefix}}happy?
    {{var_prefix}}happy
  end
end

# object.cr:1067 (068.cr)
class StringWrapper
  def initialize(@string : String)
  end

  delegate downcase, to: @string
  delegate gsub, to: @string
  delegate empty?, capitalize, to: @string
  delegate :[], to: @string
end

wrapper = StringWrapper.new "HELLO"
wrapper.downcase       # => "hello"
wrapper.gsub(/E/, "A") # => "HALLO"
wrapper.empty?         # => false
wrapper.capitalize     # => "Hello"

# object.cr:1108 (069.cr)
class Person
  def initialize(@name, @age)
  end

  # Define a hash(hasher) method based on @name and @age
  def_hash @name, @age
end

# object.cr:1130 (070.cr)
class Person
  def initialize(@name, @age)
  end

  # Define a `==` method that compares @name and @age
  def_equals @name, @age
end

# object.cr:1152 (071.cr)
class Person
  def initialize(@name, @age)
  end

  # Define a hash method based on @name and @age
  # Define a `==` method that compares @name and @age
  def_equals_and_hash @name, @age
end

# object.cr:1169 (072.cr)
class StringWrapper
  def initialize(@string : String)
  end

  forward_missing_to @string
end

wrapper = StringWrapper.new "HELLO"
wrapper.downcase       # => "hello"
wrapper.gsub(/E/, "A") # => "HALLO"
