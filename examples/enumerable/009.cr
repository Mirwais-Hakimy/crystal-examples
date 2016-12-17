# enumerable.cr:220
["Alice", "Bob"].map { |name| name.match(/^A./) }         # => [#<Regex::MatchData "Al">, nil]
["Alice", "Bob"].compact_map { |name| name.match(/^A./) } # => [#<Regex::MatchData "Al">]
