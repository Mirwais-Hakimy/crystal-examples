# object.cr:431
class Person
  {{var_prefix}}name : String?

  def {{method_prefix}}name?
    {{var_prefix}}name
  end

  def {{method_prefix}}name
    {{var_prefix}}name.not_nil!
  end
end
