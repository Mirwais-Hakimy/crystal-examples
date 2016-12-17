# yaml/schema/core.cr: 2 examples
require "yaml"

# yaml/schema/core.cr:58 (001.cr)
# pending by 'file:pendings/yaml/schema/core/001.cr'
# YAML::Schema::Core.parse_scalar("hello") # => "hello"
# YAML::Schema::Core.parse_scalar("1.2")   # => 1.2
# YAML::Schema::Core.parse_scalar("false") # => false

# yaml/schema/core.cr:110 (002.cr)
YAML::Schema::Core.reserved_string?("hello") # => false
YAML::Schema::Core.reserved_string?("1.2")   # => true
YAML::Schema::Core.reserved_string?("false") # => true
