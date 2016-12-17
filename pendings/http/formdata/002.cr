# http/formdata.cr:51
require "http"

IO.pipe do |reader, writer|
  channel = Channel(String).new(1)

  spawn do
    HTTP::FormData.build(writer) do |formdata|
      channel.send(formdata.content_type)

      formdata.field("name", "foo")
      File.open("foo.png") do |file|
        metadata = HTTP::FormData::FileMetadata.new(filename: "foo.png")
        headers = HTTP::Headers{"Content-Type" => "image/png"}
        formdata.file("file", file, metadata, headers)
      end
    end

    writer.close
  end

  headers = HTTP::Headers{"Content-Type" => channel.receive}
  response = HTTP::Client.post("http://localhost:8085/", body: reader, headers: headers)

  puts "Response code #{response.status_code}"
  puts "File path: #{response.body}"
end
