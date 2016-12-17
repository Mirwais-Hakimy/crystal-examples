# json/builder.cr:372
require "json"

string = JSON.build do |json|
  json.object do
    json.field "name", "foo"
    json.field "values" do
      json.array do
        json.number 1
        json.number 2
        json.number 3
      end
    end
  end
end
string # => %<{"name":"foo","values":[1,2,3]}>
