# http/server/handler.cr: 1 examples
require "http/server/handler"

# http/server/handler.cr:7 (001.cr)
class CustomHandler
  include HTTP::Handler

  def call(context)
    puts "Doing some stuff"
    call_next(context)
  end
end
