require "spec"
require "yaml"
it "yaml.cr" do
puts # :nocode:

puts "# yaml.cr:18 (001.cr)" # :nocode: :example:
# require "yaml"

data = YAML.parse <<-END
         ---
         foo:
           bar:
             baz:
               - qux
               - fox
         END
( data["foo"]["bar"]["baz"][1].as_s ).to_s.should eq( "fox" )

puts "# yaml.cr:35 (002.cr)" # :nocode: :example:
# pending by 'file:pendings/yaml/002.cr' # :pending:
# require "yaml"
# 
# yaml = File.open("path/to/file.yml") do |file|
#   YAML.parse(file)
# end

puts "# yaml.cr:69 (003.cr)" # :nocode: :example:
( yaml = YAML.dump({hello: "world"}) ).to_s.should eq( "---\nhello: world\n" )
File.open("foo.yml", "w") { |f| YAML.dump({hello: "world"}, f) } # writes it to the file
# or:
( yaml = {hello: "world"}.to_yaml ).to_s.should eq( "---\nhello: world\n" )
File.open("foo.yml", "w") { |f| {hello: "world"}.to_yaml(f) } # writes it to the file

puts "# yaml.cr:116 (004.cr)" # :nocode: :example:
# require "yaml"

YAML.parse(File.read("./foo.yml"))
# => {
# => "data" => {
# => "string" => "foobar",
# => "array" => ["John", "Sarah"],
# => "hash" => {"key" => "value"},
# => "paragraph" => "foo\nbar\n"
# => }

puts "# yaml.cr:141 (005.cr)" # :nocode: :example:
# require "yaml"

YAML.parse_all(File.read("./foo.yml"))
# => [{"foo" => "bar"}, {"hello" => "world"}]


end
