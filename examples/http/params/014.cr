# http/params.cr:226
require "http/params"
params.add("item", "keychain")
params.fetch_all("item") # => ["pencil", "book", "workbook", "keychain"]
