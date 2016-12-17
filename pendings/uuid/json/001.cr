# uuid/json.cr:8
require "json"
require "uuid"
require "uuid/json"

class Example
  JSON.mapping id: UUID
end

example = Example.from_json(%({"id": "ba714f86-cac6-42c7-8956-bcf5105e1b81"}))

uuid = UUID.new("87b3042b-9b9a-41b7-8b15-a93d3f17025e")
uuid.to_json # => "87b3042b-9b9a-41b7-8b15-a93d3f17025e"
