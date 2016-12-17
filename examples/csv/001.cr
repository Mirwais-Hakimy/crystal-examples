# csv.cr:33
require "csv"

csv = CSV.new("Name, Age\nJohn, 20\nPeter, 30", headers: true)
csv.next # => true

csv["Name"]  # => "John"
csv[0]       # => "John"
csv[-2]      # => "John"
csv[/name/i] # => "John"

csv["Age"] # => " 20"

csv.row.to_a # => ["John", " 20"]
csv.row.to_h # => {"Name" => "John", "Age" => " 20"}

csv.next    # => true
csv["Name"] # => "Peter"

csv.next # => false
