require "spec"
require "yaml"
puts "# yaml/mapping.cr:9 (001.cr)" # :nocode: :example:
# require "yaml"

class Employee
  YAML.mapping(
    title: String,
    name: String,
  )
end

employee = Employee.from_yaml("title: Manager\nname: John")
( employee.title ).to_s.should eq( "Manager" )
( employee.name ).to_s.should eq( "John" )

employee.name = "Jenny"
( employee.name ).to_s.should eq( "Jenny" )

puts "# yaml/mapping.cr:30 (002.cr)" # :nocode: :example:
employee = Employee.from_yaml("title: Manager\nname: John\nage: 30")
# employee.age # undefined method 'age'. (compile error)

expect_raises(YAML::ParseException) { Employee.from_yaml("title: Manager") }

puts "# yaml/mapping.cr:39 (003.cr)" # :nocode: :example:
class Employer
  YAML.mapping(
    title: String,
    name: {
      type:    String,
      nilable: true,
      key:     "firstname",
    },
  )
end

