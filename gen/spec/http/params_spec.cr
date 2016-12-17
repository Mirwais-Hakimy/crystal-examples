require "spec"
require "http/params"
it "http/params.cr" do
puts # :nocode:

puts "# http/params.cr:10 (001.cr)" # :nocode: :example:
HTTP::Params.parse("foo=bar&foo=baz&qux=zoo")
# => #<HTTP::Params @raw_params = {"foo" => ["bar", "baz"], "qux" => ["zoo"]}>

puts "# http/params.cr:25 (002.cr)" # :nocode: :example:
query = "foo=bar&foo=baz&qux=zoo"
HTTP::Params.parse(query) do |key, value|
  # ...
end

puts "# http/params.cr:81 (003.cr)" # :nocode: :example:
( HTTP::Params.encode({"foo" => "bar", "baz" => "qux"}) ).to_s.should eq( "foo=bar&baz=qux" )

puts "# http/params.cr:94 (004.cr)" # :nocode: :example:
( HTTP::Params.encode({foo: "bar", baz: "qux"}) ).to_s.should eq( "foo=bar&baz=qux" )

puts "# http/params.cr:111 (005.cr)" # :nocode: :example:
params = HTTP::Params.build do |form|
  form.add "color", "black"
  form.add "name", "crystal"
  form.add "year", "2012 - today"
end
( params ).to_s.should eq( "color=black&name=crystal&year=2012+-+today" )

puts "# http/params.cr:145 (006.cr)" # :nocode: :example:
params = HTTP::Params.parse("email=john@example.org")
( params["email"] ).to_s.should eq( "john@example.org" )
# params["non_existent_param"] # KeyError

puts "# http/params.cr:156 (007.cr)" # :nocode: :example:
( params["email"]? ).to_s.should eq( "john@example.org" )
params["non_existent_param"]? # nil

puts "# http/params.cr:166 (008.cr)" # :nocode: :example:
( params.has_key?("email") ).should eq( true )
( params.has_key?("garbage") ).should eq( false )

puts "# http/params.cr:174 (009.cr)" # :nocode: :example:
( Params.new.empty? ).should eq( true )
( Params.parse("foo=bar&foo=baz&qux=zoo").empty? ).should eq( false )

puts "# http/params.cr:182 (010.cr)" # :nocode: :example:
params["item"] = "pencil"

puts "# http/params.cr:192 (011.cr)" # :nocode: :example:
params.set_all("item", ["pencil", "book", "workbook"])
( params.fetch_all("item") ).should eq( ["pencil", "book", "workbook"] )

puts "# http/params.cr:203 (012.cr)" # :nocode: :example:
( params.fetch("email", "none@example.org") ).to_s.should eq( "john@example.org" )
( params.fetch("non_existent_param", "default value") ).to_s.should eq( "default value" )

puts "# http/params.cr:214 (013.cr)" # :nocode: :example:
params.fetch("email") { raise "Email is missing" }              # raises "Email is missing"
( params.fetch("non_existent_param") { "default computed value" } ).to_s.should eq( "default computed value" )

puts "# http/params.cr:226 (014.cr)" # :nocode: :example:
params.add("item", "keychain")
( params.fetch_all("item") ).should eq( ["pencil", "book", "workbook", "keychain"] )

puts "# http/params.cr:238 (015.cr)" # :nocode: :example:
params.set_all("item", ["keychain", "keynote"])
( params.fetch_all("item") ).should eq( ["keychain", "keynote"] )

puts "# http/params.cr:248 (016.cr)" # :nocode: :example:
params.each do |name, value|
  puts "#{name} => #{value}"
end

# Outputs:
# email => john@example.org
# item => keychain
# item => keynote

puts "# http/params.cr:269 (017.cr)" # :nocode: :example:
( params.delete("item") ).to_s.should eq( "keychain" )
( params.fetch_all("item") ).should eq( ["keynote"] )

( params.delete("item") ).to_s.should eq( "keynote" )
# params["item"]        # KeyError

# params.delete("non_existent_param") # KeyError

puts "# http/params.cr:287 (018.cr)" # :nocode: :example:
params.set_all("comments", ["hello, world!", ":+1:"])
( params.delete_all("comments") ).should eq( ["hello, world!", ":+1:"] )
( params.has_key?("comments") ).should eq( false )

puts "# http/params.cr:298 (019.cr)" # :nocode: :example:
params = HTTP::Params.parse("item=keychain&item=keynote&email=john@example.org")
( params.to_s ).to_s.should eq( "item=keychain&item=keynote&email=john%40example.org" )


end
