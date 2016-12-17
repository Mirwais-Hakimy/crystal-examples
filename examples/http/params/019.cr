# http/params.cr:298
require "http/params"
params = HTTP::Params.parse("item=keychain&item=keynote&email=john@example.org")
params.to_s # => "item=keychain&item=keynote&email=john%40example.org"
