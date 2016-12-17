# digest/base.cr:14
require "digest/*"
digest = Digest::MD5.digest do |ctx|
  ctx.update "f"
  ctx.update "oo"
end
digest.to_slice.hexstring # => "acbd18db4cc2f85cedef654fccc4a4d8"
