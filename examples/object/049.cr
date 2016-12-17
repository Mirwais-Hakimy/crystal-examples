# object.cr:741
class Person
  {{var_prefix}}name : String = "John Doe"

  def {{method_prefix}}name=({{var_prefix}}name : String)
  end

  def {{method_prefix}}name
    {{var_prefix}}name
  end
end
