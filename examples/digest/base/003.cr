# digest/base.cr:41
require "digest/*"
Digest::MD5.hexdigest do |ctx|
  ctx.update "f"
  ctx.update "oo"
end
# => "acbd18db4cc2f85cedef654fccc4a4d8"
