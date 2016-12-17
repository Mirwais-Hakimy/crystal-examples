# yaml/serialization.cr:67
require "yaml"
struct A
  include YAML::Serializable
  @a : Int32
  @b : Float64 = 1.0
end

A.from_yaml("---\na: 1\n") # => A(@a=1, @b=1.0)
