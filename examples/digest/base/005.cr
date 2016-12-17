# digest/base.cr:67
require "digest/*"
Digest::SHA1.base64digest do |ctx|
  ctx.update "f"
  ctx.update "oo"
end
# => "C+7Hteo/D9vJXQ3UfzxbwnXaijM="
