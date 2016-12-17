# object.cr:994
class Person
  {{var_prefix}}happy : Bool = true

  def {{method_prefix}}happy=({{var_prefix}}happy : Bool)
  end

  def {{method_prefix}}happy? : Bool
    {{var_prefix}}happy
  end
end
