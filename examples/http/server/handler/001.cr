# http/server/handler.cr:7
require "http/server/handler"
class CustomHandler
  include HTTP::Handler

  def call(context)
    puts "Doing some stuff"
    call_next(context)
  end
end
