# regex.cr:228
/ab+c/ix.options      # => Regex::Options::IGNORE_CASE | Regex::Options::EXTENDED
/ab+c/ix.options.to_s # => "IGNORE_CASE | EXTENDED"
