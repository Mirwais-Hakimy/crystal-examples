require "spec"
require "http/server/handler"
puts "# http/server/handler.cr:7 (001.cr)" # :nocode: :example:
class CustomHandler
  include HTTP::Handler

  def call(context)
    puts "Doing some stuff"
    call_next(context)
  end
end

