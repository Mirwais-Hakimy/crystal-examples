# http/common.cr:85
require "http/common"
line = "Server: nginx"
name, value = line.split ':', 2
{name, value.lstrip} # => {"Server", "nginx"}
