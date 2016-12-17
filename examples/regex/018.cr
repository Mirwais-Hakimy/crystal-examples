# regex.cr:300
string = Regex.escape("\*?{}.") # => "\\*\\?\\{\\}\\."
/#{string}/                     # => /\*\?\{\}\./
