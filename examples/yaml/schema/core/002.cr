# yaml/schema/core.cr:110
require "yaml"
YAML::Schema::Core.reserved_string?("hello") # => false
YAML::Schema::Core.reserved_string?("1.2")   # => true
YAML::Schema::Core.reserved_string?("false") # => true
