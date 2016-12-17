require "spec"
require "http/headers"
it "http/headers.cr" do
puts # :nocode:

puts "# http/headers.cr:77 (001.cr)" # :nocode: :example:
headers = HTTP::Headers{"Connection" => "keep-alive, Upgrade"}
( headers.includes_word?("Connection", "Upgrade") ).should eq( true )


end
