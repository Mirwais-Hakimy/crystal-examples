# yaml.cr:18
require "yaml"

data = YAML.parse <<-END
         ---
         foo:
           bar:
             baz:
               - qux
               - fox
         END
data["foo"]["bar"]["baz"][1].as_s # => "fox"
