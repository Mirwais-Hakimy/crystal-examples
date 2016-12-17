# yaml/mapping.cr:30
require "yaml"
employee = Employee.from_yaml("title: Manager\nname: John\nage: 30")
# employee.age # undefined method 'age'. (compile error)

Employee.from_yaml("title: Manager") # raises YAML::ParseException
