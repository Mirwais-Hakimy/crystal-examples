# yaml/serialization.cr:102
require "yaml"
@[YAML::Serializable::Options(emit_nulls: true)]
class A
  include YAML::Serializable
  @a : Int32?
end
