# http/params.cr:111
require "http/params"
params = HTTP::Params.build do |form|
  form.add "color", "black"
  form.add "name", "crystal"
  form.add "year", "2012 - today"
end
params # => "color=black&name=crystal&year=2012+-+today"
