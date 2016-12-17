# http/params.cr: 19 examples
require "http/params"

# http/params.cr:10 (001.cr)
HTTP::Params.parse("foo=bar&foo=baz&qux=zoo")
# => #<HTTP::Params @raw_params = {"foo" => ["bar", "baz"], "qux" => ["zoo"]}>

# http/params.cr:25 (002.cr)
query = "foo=bar&foo=baz&qux=zoo"
HTTP::Params.parse(query) do |key, value|
  # ...
end

# http/params.cr:81 (003.cr)
HTTP::Params.encode({"foo" => "bar", "baz" => "qux"}) # => "foo=bar&baz=qux"

# http/params.cr:94 (004.cr)
HTTP::Params.encode({foo: "bar", baz: "qux"}) # => "foo=bar&baz=qux"

# http/params.cr:111 (005.cr)
params = HTTP::Params.build do |form|
  form.add "color", "black"
  form.add "name", "crystal"
  form.add "year", "2012 - today"
end
params # => "color=black&name=crystal&year=2012+-+today"

# http/params.cr:145 (006.cr)
params = HTTP::Params.parse("email=john@example.org")
params["email"]              # => "john@example.org"
# params["non_existent_param"] # KeyError

# http/params.cr:156 (007.cr)
params["email"]?              # => "john@example.org"
params["non_existent_param"]? # nil

# http/params.cr:166 (008.cr)
params.has_key?("email")   # => true
params.has_key?("garbage") # => false

# http/params.cr:174 (009.cr)
Params.new.empty?                              # => true
Params.parse("foo=bar&foo=baz&qux=zoo").empty? # => false

# http/params.cr:182 (010.cr)
params["item"] = "pencil"

# http/params.cr:192 (011.cr)
params.set_all("item", ["pencil", "book", "workbook"])
params.fetch_all("item") # => ["pencil", "book", "workbook"]

# http/params.cr:203 (012.cr)
params.fetch("email", "none@example.org")           # => "john@example.org"
params.fetch("non_existent_param", "default value") # => "default value"

# http/params.cr:214 (013.cr)
params.fetch("email") { raise "Email is missing" }              # raises "Email is missing"
params.fetch("non_existent_param") { "default computed value" } # => "default computed value"

# http/params.cr:226 (014.cr)
params.add("item", "keychain")
params.fetch_all("item") # => ["pencil", "book", "workbook", "keychain"]

# http/params.cr:238 (015.cr)
params.set_all("item", ["keychain", "keynote"])
params.fetch_all("item") # => ["keychain", "keynote"]

# http/params.cr:248 (016.cr)
params.each do |name, value|
  puts "#{name} => #{value}"
end

# Outputs:
# email => john@example.org
# item => keychain
# item => keynote

# http/params.cr:269 (017.cr)
params.delete("item")    # => "keychain"
params.fetch_all("item") # => ["keynote"]

params.delete("item") # => "keynote"
# params["item"]        # KeyError

# params.delete("non_existent_param") # KeyError

# http/params.cr:287 (018.cr)
params.set_all("comments", ["hello, world!", ":+1:"])
params.delete_all("comments") # => ["hello, world!", ":+1:"]
params.has_key?("comments")   # => false

# http/params.cr:298 (019.cr)
params = HTTP::Params.parse("item=keychain&item=keynote&email=john@example.org")
params.to_s # => "item=keychain&item=keynote&email=john%40example.org"
