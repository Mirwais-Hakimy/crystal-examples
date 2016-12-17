# errno.cr:209
err = LibC.some_call
if err == -1
  raise Errno.new("some_call")
end
