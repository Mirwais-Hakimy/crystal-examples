# yaml/mapping.cr:39
require "yaml"
class Employer
  YAML.mapping(
    title: String,
    name: {
      type:    String,
      nilable: true,
      key:     "firstname",
    },
  )
end
