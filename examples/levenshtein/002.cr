# levenshtein.cr:50
require "levenshtein"
finder = Levenshtein::Finder.new "hallo"
finder.test "hay"
finder.test "hall"
finder.test "hallo world"

finder.best_match # => "hall"
