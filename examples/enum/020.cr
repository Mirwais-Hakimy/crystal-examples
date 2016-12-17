# enum.cr:294
(IOMode::Read | IOMode::Async).each do |member, value|
  # yield IOMode::Read, 1
  # yield IOMode::Async, 3
end
