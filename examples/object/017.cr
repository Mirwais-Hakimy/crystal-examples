# object.cr:317
class Person
  {{var_prefix}}name = "John Doe"

  def {{method_prefix}}name : String
    {{var_prefix}}name
  end
end
