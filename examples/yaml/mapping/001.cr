# yaml/mapping.cr:9
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
