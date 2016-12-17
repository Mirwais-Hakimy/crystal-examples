# yaml/serialization.cr:85
require "yaml"
struct A
  include YAML::Serializable
  include YAML::Serializable::Unmapped
  @a : Int32
end

a = A.from_yaml("---\na: 1\nb: 2\n") # => A(@yaml_unmapped={"b" => 2_i64}, @a=1)
a.to_yaml                            # => "---\na: 1\nb: 2\n"
