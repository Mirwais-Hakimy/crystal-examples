# object.cr:865
class Person
  def {{method_prefix}}name=({{var_prefix}}name)
  end

  def {{method_prefix}}name?
    {{var_prefix}}name
  end

  def {{method_prefix}}name
    {{var_prefix}}name.not_nil!
  end
end
