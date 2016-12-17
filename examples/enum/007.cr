# enum.cr:68
color = Color::Blue
color.red?  # => false
color.blue? # => true

mode = IOMode::Read | IOMode::Async
mode.read?  # => true
mode.write? # => false
mode.async? # => true
