# enum.cr: 28 examples

# enum.cr:5 (001.cr)
enum Color
  Red   # 0
  Green # 1
  Blue  # 2
end

# enum.cr:17 (002.cr)
Color::Green.value # => 1

# enum.cr:23 (003.cr)
typeof(Color::Red) # => Color

# enum.cr:31 (004.cr)
@[Flags]
enum IOMode
  Read  # 1
  Write # 2
  Async # 4
end

# enum.cr:46 (005.cr)
Color.new(1).to_s # => "Green"

# enum.cr:53 (006.cr)
Color.new(10).to_s # => "10"

# enum.cr:68 (007.cr)
color = Color::Blue
color.red?  # => false
color.blue? # => true

mode = IOMode::Read | IOMode::Async
mode.read?  # => true
mode.write? # => false
mode.async? # => true

# enum.cr:81 (008.cr)
case color
when .red?
  puts "Got red"
when .blue?
  puts "Got blue"
end

# enum.cr:126 (009.cr)
Color::Red.to_s                     # => "Red"
IOMode::None.to_s                   # => "None"
(IOMode::Read | IOMode::Write).to_s # => "Read | Write"

Color.new(10).to_s # => "10"

# enum.cr:150 (010.cr)
Color::Blue.to_i                    # => 2
(IOMode::Read | IOMode::Write).to_i # => 3

Color.new(10).to_i # => 10

# enum.cr:177 (011.cr)
Color::Red + 1 # => Color::Green
Color::Red + 2 # => Color::Blue
Color::Red + 3 # => Color.new(3)

# enum.cr:189 (012.cr)
Color::Blue - 1 # => Color::Green
Color::Blue - 2 # => Color::Red
Color::Blue - 3 # => Color.new(-1)

# enum.cr:202 (013.cr)
(IOMode::Read | IOMode::Async) # => IOMode::Read | IOMode::Async

# enum.cr:213 (014.cr)
(IOMode::Read | IOMode::Async) & IOMode::Read # => IOMode::Read

# enum.cr:236 (015.cr)
Color::Red <=> Color::Blue  # => -1
Color::Blue <=> Color::Red  # => 1
Color::Blue <=> Color::Blue # => 0

# enum.cr:254 (016.cr)
# pending by 'file:pendings/enum/016.cr'
# (member & value) != 0

# enum.cr:260 (017.cr)
# pending by 'file:pendings/enum/017.cr'
# member.includes?(value)

# enum.cr:268 (018.cr)
mode = IOMode::Read | IOMode::Write
mode.includes?(IOMode::Read)  # => true
mode.includes?(IOMode::Async) # => false

# enum.cr:279 (019.cr)
Color::Red == Color::Red  # => true
Color::Red == Color::Blue # => false

# enum.cr:294 (020.cr)
(IOMode::Read | IOMode::Async).each do |member, value|
  # yield IOMode::Read, 1
  # yield IOMode::Async, 3
end

# enum.cr:317 (021.cr)
Color.names # => ["Red", "Green", "Blue"]

# enum.cr:330 (022.cr)
Color.values # => [Color::Red, Color::Green, Color::Blue]

# enum.cr:344 (023.cr)
Color.from_value?(0) # => Color::Red
Color.from_value?(1) # => Color::Green
Color.from_value?(2) # => Color::Blue
Color.from_value?(3) # => nil

# enum.cr:368 (024.cr)
Color.from_value(0) # => Color::Red
Color.from_value(1) # => Color::Green
Color.from_value(2) # => Color::Blue
Color.from_value(3) # raises Exception

# enum.cr:393 (025.cr)
Color.parse("Red")    # => Color::Red
Color.parse("BLUE")   # => Color::Blue
# Color.parse("Yellow") # raises ArgumentError

# enum.cr:409 (026.cr)
Color.parse?("Red")    # => Color::Red
Color.parse?("BLUE")   # => Color::Blue
Color.parse?("Yellow") # => nil

# enum.cr:433 (027.cr)
IOMode.flags(Read, Write) # => IOMode::Read | IOMode::Write

# enum.cr:445 (028.cr)
IOMode.each do |member, value|
  # yield IOMode::Read, 1
  # yield IOMode::Write, 2
  # yield IOMode::Async, 3
end
