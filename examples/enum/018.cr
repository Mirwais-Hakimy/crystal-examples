# enum.cr:268
mode = IOMode::Read | IOMode::Write
mode.includes?(IOMode::Read)  # => true
mode.includes?(IOMode::Async) # => false
