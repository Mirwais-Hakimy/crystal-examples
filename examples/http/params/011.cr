# http/params.cr:192
require "http/params"
params.set_all("item", ["pencil", "book", "workbook"])
params.fetch_all("item") # => ["pencil", "book", "workbook"]
