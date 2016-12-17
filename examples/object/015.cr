# object.cr:296
class Person
  {{var_prefix}}name : String = "John Doe"

  def {{method_prefix}}name : String
    {{var_prefix}}name
  end
end
