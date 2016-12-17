# regex.cr:528
re = /A*/i                 # => /A*/i
re.to_s                    # => "(?i-msx:A*)"
"Crystal".match(/t#{re}l/) # => #<Regex::MatchData "tal">
re = /A*/                  # => "(?-imsx:A*)"
"Crystal".match(/t#{re}l/) # => nil
