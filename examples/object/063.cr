# object.cr:971
class Person
  {{var_prefix}}happy : Bool

  def {{method_prefix}}happy=({{var_prefix}}happy : Bool)
  end

  def {{method_prefix}}happy? : Bool
    {{var_prefix}}happy
  end
end
