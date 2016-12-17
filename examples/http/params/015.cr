# http/params.cr:238
require "http/params"
params.set_all("item", ["keychain", "keynote"])
params.fetch_all("item") # => ["keychain", "keynote"]
