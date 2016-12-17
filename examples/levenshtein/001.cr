# levenshtein.cr:5
require "levenshtein"

Levenshtein.distance("algorithm", "altruistic") # => 6
Levenshtein.distance("hello", "hallo")          # => 1
Levenshtein.distance("こんにちは", "こんちは")           # => 1
Levenshtein.distance("hey", "hey")              # => 0
