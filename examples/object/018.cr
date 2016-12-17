# object.cr:331
class Person
  {{macro_prefix}}getter(birth_date) { Time.now }
end
