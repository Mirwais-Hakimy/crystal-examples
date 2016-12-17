# yaml/mapping.cr: 3 examples
require "yaml"

# yaml/mapping.cr:9 (001.cr)
require "yaml"

class Employee
  YAML.mapping(
    title: String,
    name: String,
  )
end

employee = Employee.from_yaml("title: Manager\nname: John")
employee.title # => "Manager"
employee.name  # => "John"

employee.name = "Jenny"
employee.name # => "Jenny"

# yaml/mapping.cr:30 (002.cr)
employee = Employee.from_yaml("title: Manager\nname: John\nage: 30")
# employee.age # undefined method 'age'. (compile error)

Employee.from_yaml("title: Manager") # raises YAML::ParseException

# yaml/mapping.cr:39 (003.cr)
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
