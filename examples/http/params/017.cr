# http/params.cr:269
require "http/params"
params.delete("item")    # => "keychain"
params.fetch_all("item") # => ["keynote"]

params.delete("item") # => "keynote"
# params["item"]        # KeyError

# params.delete("non_existent_param") # KeyError
