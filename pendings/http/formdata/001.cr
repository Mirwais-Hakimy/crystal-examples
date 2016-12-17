# http/formdata.cr:11
require "http"
require "tempfile"

server = HTTP::Server.new do |context|
  name = nil
  file = nil
  HTTP::FormData.parse(context.request) do |part|
    case part.name
    when "name"
      name = part.body.gets_to_end
    when "file"
      file = Tempfile.open("upload") do |file|
        IO.copy(part.body, file)
      end
    end
  end

  unless name && file
    context.response.status_code = 400
    next
  end

  context.response << file.path
end

server.bind_tcp 8085
server.listen
