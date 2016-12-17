# ecr.cr:35
# greeting.ecr
<%- if @name -%>
Greeting, <%= @name %>!
<%- else -%>
Greeting!
<%- end -%>

Greeting.new(nil).to_s #=> Greeting!
