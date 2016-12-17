# io.cr:82
STDIN.read_timeout = 1
STDIN.gets # raises IO::Timeout (after 1 second)
