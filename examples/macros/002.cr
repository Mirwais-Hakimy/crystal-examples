# macros.cr:20
record Person, first_name : String, last_name : String do
  def full_name
    "#{first_name} #{last_name}"
  end
end

person = Person.new "John", "Doe"
person.full_name # => "John Doe"
