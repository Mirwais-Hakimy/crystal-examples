# yaml/any.cr:5
require "yaml"

data = YAML.parse <<-END
         ---
         foo:
           bar:
             baz:
               - qux
               - fox
         END
data["foo"]["bar"]["baz"][0].as_s # => "qux"
data["foo"]["bar"]["baz"].as_a    # => ["qux", "fox"]
