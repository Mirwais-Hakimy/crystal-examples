require "spec"

puts "# object.cr:28 (001.cr)" # :nocode: :example:
case value
when x
  # something when x
when y
  # something when y
end

puts "# object.cr:39 (002.cr)" # :nocode: :example:
if x === value
  # something when x
elsif y === value
  # something when y
end

puts "# object.cr:67 (003.cr)" # :nocode: :example:
def hash(hasher)
  hasher = @some_ivar.hash(hasher)
  hasher = @some_other_ivar.hash(hasher)
  hasher
end

puts "# object.cr:151 (004.cr)" # :nocode: :example:
(1..10).tap { |x| puts "original: #{x.inspect}" }
  .to_a.tap { |x| puts "array: #{x.inspect}" }
  .select { |x| x % 2 == 0 }.tap { |x| puts "evens: #{x.inspect}" }
  .map { |x| x*x }.tap { |x| puts "squares: #{x.inspect}" }

puts "# object.cr:167 (005.cr)" # :nocode: :example:
# First program argument in downcase, or nil
ARGV[0]?.try &.downcase

puts "# object.cr:182 (006.cr)" # :nocode: :example:
str = "hello"
str.itself.object_id == str.object_id # => true

puts "# object.cr:207 (007.cr)" # :nocode: :example:
( 0x01020304.unsafe_as(StaticArray(UInt8, 4)) ).should eq( StaticArray[4, 3, 2, 1] )

puts "# object.cr:213 (008.cr)" # :nocode: :example:
( 1.234_f64.unsafe_as(Int64) ).should eq( 4608236261112822104 )

puts "# object.cr:241 (009.cr)" # :nocode: :example:
class Person
  {{macro_prefix}}getter name
end

puts "# object.cr:249 (010.cr)" # :nocode: :example:
class Person
  def {{method_prefix}}name
    {{var_prefix}}name
  end
end

puts "# object.cr:259 (011.cr)" # :nocode: :example:
class Person
  {{macro_prefix}}getter :name, "age"
end

puts "# object.cr:268 (012.cr)" # :nocode: :example:
class Person
  {{macro_prefix}}getter name : String
end

puts "# object.cr:276 (013.cr)" # :nocode: :example:
class Person
  {{var_prefix}}name : String

  def {{method_prefix}}name : String
    {{var_prefix}}name
  end
end

puts "# object.cr:288 (014.cr)" # :nocode: :example:
class Person
  {{macro_prefix}}getter name : String = "John Doe"
end

puts "# object.cr:296 (015.cr)" # :nocode: :example:
class Person
  {{var_prefix}}name : String = "John Doe"

  def {{method_prefix}}name : String
    {{var_prefix}}name
  end
end

puts "# object.cr:309 (016.cr)" # :nocode: :example:
class Person
  {{macro_prefix}}getter name = "John Doe"
end

puts "# object.cr:317 (017.cr)" # :nocode: :example:
class Person
  {{var_prefix}}name = "John Doe"

  def {{method_prefix}}name : String
    {{var_prefix}}name
  end
end

puts "# object.cr:331 (018.cr)" # :nocode: :example:
class Person
  {{macro_prefix}}getter(birth_date) { Time.now }
end

puts "# object.cr:339 (019.cr)" # :nocode: :example:
class Person
  def {{method_prefix}}birth_date
    {{var_prefix}}birth_date ||= Time.now
  end
end

puts "# object.cr:392 (020.cr)" # :nocode: :example:
class Person
  {{macro_prefix}}getter! name
end

puts "# object.cr:400 (021.cr)" # :nocode: :example:
class Person
  def {{method_prefix}}name?
    {{var_prefix}}name
  end

  def {{method_prefix}}name
    {{var_prefix}}name.not_nil!
  end
end

puts "# object.cr:414 (022.cr)" # :nocode: :example:
class Person
  {{macro_prefix}}getter! :name, "age"
end

puts "# object.cr:423 (023.cr)" # :nocode: :example:
class Person
  {{macro_prefix}}getter! name : String
end

puts "# object.cr:431 (024.cr)" # :nocode: :example:
class Person
  {{var_prefix}}name : String?

  def {{method_prefix}}name?
    {{var_prefix}}name
  end

  def {{method_prefix}}name
    {{var_prefix}}name.not_nil!
  end
end

puts "# object.cr:465 (025.cr)" # :nocode: :example:
class Person
  {{macro_prefix}}getter? happy
end

puts "# object.cr:473 (026.cr)" # :nocode: :example:
class Person
  def {{method_prefix}}happy?
    {{var_prefix}}happy
  end
end

puts "# object.cr:483 (027.cr)" # :nocode: :example:
class Person
  {{macro_prefix}}getter? :happy, "famous"
end

puts "# object.cr:492 (028.cr)" # :nocode: :example:
class Person
  {{macro_prefix}}getter? happy : Bool
end

puts "# object.cr:500 (029.cr)" # :nocode: :example:
class Person
  {{var_prefix}}happy : Bool

  def {{method_prefix}}happy? : Bool
    {{var_prefix}}happy
  end
end

puts "# object.cr:512 (030.cr)" # :nocode: :example:
class Person
  {{macro_prefix}}getter? happy : Bool = true
end

puts "# object.cr:520 (031.cr)" # :nocode: :example:
class Person
  {{var_prefix}}happy : Bool = true

  def {{method_prefix}}happy? : Bool
    {{var_prefix}}happy
  end
end

puts "# object.cr:533 (032.cr)" # :nocode: :example:
class Person
  {{macro_prefix}}getter? happy = true
end

puts "# object.cr:541 (033.cr)" # :nocode: :example:
class Person
  {{var_prefix}}happy = true

  def {{method_prefix}}happy?
    {{var_prefix}}happy
  end
end

puts "# object.cr:576 (034.cr)" # :nocode: :example:
class Person
  {{macro_prefix}}setter name
end

puts "# object.cr:584 (035.cr)" # :nocode: :example:
class Person
  def {{method_prefix}}name=({{var_prefix}}name)
  end
end

puts "# object.cr:593 (036.cr)" # :nocode: :example:
class Person
  {{macro_prefix}}setter :name, "age"
end

puts "# object.cr:602 (037.cr)" # :nocode: :example:
class Person
  {{macro_prefix}}setter name : String
end

puts "# object.cr:610 (038.cr)" # :nocode: :example:
class Person
  {{var_prefix}}name : String

  def {{method_prefix}}name=({{var_prefix}}name : String)
  end
end

puts "# object.cr:621 (039.cr)" # :nocode: :example:
class Person
  {{macro_prefix}}setter name : String = "John Doe"
end

puts "# object.cr:629 (040.cr)" # :nocode: :example:
class Person
  {{var_prefix}}name : String = "John Doe"

  def {{method_prefix}}name=({{var_prefix}}name : String)
  end
end

puts "# object.cr:641 (041.cr)" # :nocode: :example:
class Person
  {{macro_prefix}}setter name = "John Doe"
end

puts "# object.cr:649 (042.cr)" # :nocode: :example:
class Person
  {{var_prefix}}name = "John Doe"

  def {{method_prefix}}name=({{var_prefix}}name)
  end
end

puts "# object.cr:680 (043.cr)" # :nocode: :example:
class Person
  {{macro_prefix}}property name
end

puts "# object.cr:688 (044.cr)" # :nocode: :example:
class Person
  def {{method_prefix}}name=({{var_prefix}}name)
  end

  def {{method_prefix}}name
    {{var_prefix}}name
  end
end

puts "# object.cr:701 (045.cr)" # :nocode: :example:
class Person
  {{macro_prefix}}property :name, "age"
end

puts "# object.cr:710 (046.cr)" # :nocode: :example:
class Person
  {{macro_prefix}}property name : String
end

puts "# object.cr:718 (047.cr)" # :nocode: :example:
class Person
  {{var_prefix}}name : String

  def {{method_prefix}}name=({{var_prefix}}name)
  end

  def {{method_prefix}}name
    {{var_prefix}}name
  end
end

puts "# object.cr:733 (048.cr)" # :nocode: :example:
class Person
  {{macro_prefix}}property name : String = "John Doe"
end

puts "# object.cr:741 (049.cr)" # :nocode: :example:
class Person
  {{var_prefix}}name : String = "John Doe"

  def {{method_prefix}}name=({{var_prefix}}name : String)
  end

  def {{method_prefix}}name
    {{var_prefix}}name
  end
end

puts "# object.cr:757 (050.cr)" # :nocode: :example:
class Person
  {{macro_prefix}}property name = "John Doe"
end

puts "# object.cr:765 (051.cr)" # :nocode: :example:
class Person
  {{var_prefix}}name = "John Doe"

  def {{method_prefix}}name=({{var_prefix}}name : String)
  end

  def {{method_prefix}}name
    {{var_prefix}}name
  end
end

puts "# object.cr:782 (052.cr)" # :nocode: :example:
class Person
  {{macro_prefix}}property(birth_date) { Time.now }
end

puts "# object.cr:790 (053.cr)" # :nocode: :example:
class Person
  def {{method_prefix}}birth_date
    {{var_prefix}}birth_date ||= Time.now
  end

  def {{method_prefix}}birth_date=({{var_prefix}}birth_date)
  end
end

puts "# object.cr:857 (054.cr)" # :nocode: :example:
class Person
  {{macro_prefix}}property! name
end

puts "# object.cr:865 (055.cr)" # :nocode: :example:
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

puts "# object.cr:882 (056.cr)" # :nocode: :example:
class Person
  {{macro_prefix}}property! :name, "age"
end

puts "# object.cr:891 (057.cr)" # :nocode: :example:
class Person
  {{macro_prefix}}property! name : String
end

puts "# object.cr:899 (058.cr)" # :nocode: :example:
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

puts "# object.cr:933 (059.cr)" # :nocode: :example:
class Person
  {{macro_prefix}}property? happy
end

puts "# object.cr:941 (060.cr)" # :nocode: :example:
class Person
  def {{method_prefix}}happy=({{var_prefix}}happy)
  end

  def {{method_prefix}}happy?
    {{var_prefix}}happy
  end
end

puts "# object.cr:954 (061.cr)" # :nocode: :example:
class Person
  {{macro_prefix}}property? :happy, "famous"
end

puts "# object.cr:963 (062.cr)" # :nocode: :example:
class Person
  {{macro_prefix}}property? happy : Bool
end

puts "# object.cr:971 (063.cr)" # :nocode: :example:
class Person
  {{var_prefix}}happy : Bool

  def {{method_prefix}}happy=({{var_prefix}}happy : Bool)
  end

  def {{method_prefix}}happy? : Bool
    {{var_prefix}}happy
  end
end

puts "# object.cr:986 (064.cr)" # :nocode: :example:
class Person
  {{macro_prefix}}property? happy : Bool = true
end

puts "# object.cr:994 (065.cr)" # :nocode: :example:
class Person
  {{var_prefix}}happy : Bool = true

  def {{method_prefix}}happy=({{var_prefix}}happy : Bool)
  end

  def {{method_prefix}}happy? : Bool
    {{var_prefix}}happy
  end
end

puts "# object.cr:1010 (066.cr)" # :nocode: :example:
class Person
  {{macro_prefix}}property? happy = true
end

puts "# object.cr:1018 (067.cr)" # :nocode: :example:
class Person
  {{var_prefix}}happy = true

  def {{method_prefix}}happy=({{var_prefix}}happy)
  end

  def {{method_prefix}}happy?
    {{var_prefix}}happy
  end
end

puts "# object.cr:1067 (068.cr)" # :nocode: :example:
class StringWrapper
  def initialize(@string : String)
  end

  delegate downcase, to: @string
  delegate gsub, to: @string
  delegate empty?, capitalize, to: @string
  delegate :[], to: @string
end

wrapper = StringWrapper.new "HELLO"
( wrapper.downcase ).to_s.should eq( "hello" )
( wrapper.gsub(/E/, "A") ).to_s.should eq( "HALLO" )
( wrapper.empty? ).should eq( false )
( wrapper.capitalize ).to_s.should eq( "Hello" )

puts "# object.cr:1108 (069.cr)" # :nocode: :example:
class Person
  def initialize(@name, @age)
  end

  # Define a hash(hasher) method based on @name and @age
  def_hash @name, @age
end

puts "# object.cr:1130 (070.cr)" # :nocode: :example:
class Person
  def initialize(@name, @age)
  end

  # Define a `==` method that compares @name and @age
  def_equals @name, @age
end

puts "# object.cr:1152 (071.cr)" # :nocode: :example:
class Person
  def initialize(@name, @age)
  end

  # Define a hash method based on @name and @age
  # Define a `==` method that compares @name and @age
  def_equals_and_hash @name, @age
end

puts "# object.cr:1169 (072.cr)" # :nocode: :example:
class StringWrapper
  def initialize(@string : String)
  end

  forward_missing_to @string
end

wrapper = StringWrapper.new "HELLO"
( wrapper.downcase ).to_s.should eq( "hello" )
( wrapper.gsub(/E/, "A") ).to_s.should eq( "HALLO" )

