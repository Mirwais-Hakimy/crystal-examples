# digest/base.cr: 5 examples
require "digest/*"

# digest/base.cr:14 (001.cr)
digest = Digest::MD5.digest do |ctx|
  ctx.update "f"
  ctx.update "oo"
end
digest.to_slice.hexstring # => "acbd18db4cc2f85cedef654fccc4a4d8"

# digest/base.cr:30 (002.cr)
Digest::MD5.hexdigest("foo") # => "acbd18db4cc2f85cedef654fccc4a4d8"

# digest/base.cr:41 (003.cr)
Digest::MD5.hexdigest do |ctx|
  ctx.update "f"
  ctx.update "oo"
end
# => "acbd18db4cc2f85cedef654fccc4a4d8"

# digest/base.cr:58 (004.cr)
Digest::SHA1.base64digest("foo") # => "C+7Hteo/D9vJXQ3UfzxbwnXaijM="

# digest/base.cr:67 (005.cr)
Digest::SHA1.base64digest do |ctx|
  ctx.update "f"
  ctx.update "oo"
end
# => "C+7Hteo/D9vJXQ3UfzxbwnXaijM="
