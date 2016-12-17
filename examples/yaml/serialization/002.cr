# yaml/serialization.cr:50
require "yaml"
class A
  include YAML::Serializable

  @[YAML::Field(key: "my_key", emit_null: true)]
  getter a : Int32?
end
