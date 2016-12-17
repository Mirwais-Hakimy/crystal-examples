# object.cr:790
class Person
  def {{method_prefix}}birth_date
    {{var_prefix}}birth_date ||= Time.now
  end

  def {{method_prefix}}birth_date=({{var_prefix}}birth_date)
  end
end
