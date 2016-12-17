# object.cr:339
class Person
  def {{method_prefix}}birth_date
    {{var_prefix}}birth_date ||= Time.now
  end
end
