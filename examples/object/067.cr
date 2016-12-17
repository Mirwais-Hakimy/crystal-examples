# object.cr:1018
class Person
  {{var_prefix}}happy = true

  def {{method_prefix}}happy=({{var_prefix}}happy)
  end

  def {{method_prefix}}happy?
    {{var_prefix}}happy
  end
end
