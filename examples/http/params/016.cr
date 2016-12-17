# http/params.cr:248
require "http/params"
params.each do |name, value|
  puts "#{name} => #{value}"
end

# Outputs:
# email => john@example.org
# item => keychain
# item => keynote
