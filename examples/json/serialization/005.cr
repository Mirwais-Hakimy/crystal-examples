# json/serialization.cr:103
require "json"
@[JSON::Serializable::Options(emit_nulls: true)]
class A
  include JSON::Serializable
  @a : Int32?
end
