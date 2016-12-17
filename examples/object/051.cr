# object.cr:765
class Person
  {{var_prefix}}name = "John Doe"

  def {{method_prefix}}name=({{var_prefix}}name : String)
  end

  def {{method_prefix}}name
    {{var_prefix}}name
  end
end
