# levenshtein.cr: 2 examples
require "levenshtein"

# levenshtein.cr:5 (001.cr)
require "levenshtein"

Levenshtein.distance("algorithm", "altruistic") # => 6
Levenshtein.distance("hello", "hallo")          # => 1
Levenshtein.distance("こんにちは", "こんちは")           # => 1
Levenshtein.distance("hey", "hey")              # => 0

# levenshtein.cr:50 (002.cr)
finder = Levenshtein::Finder.new "hallo"
finder.test "hay"
finder.test "hall"
finder.test "hallo world"

finder.best_match # => "hall"
