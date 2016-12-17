# object.cr:520
class Person
  {{var_prefix}}happy : Bool = true

  def {{method_prefix}}happy? : Bool
    {{var_prefix}}happy
  end
end
