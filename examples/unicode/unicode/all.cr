# unicode/unicode.cr: 1 examples

# unicode/unicode.cr:18 (001.cr)
'İ'.downcase(Unicode::CaseOptions::Turkic) # => 'i'
'I'.downcase(Unicode::CaseOptions::Turkic) # => 'ı'
'i'.upcase(Unicode::CaseOptions::Turkic)   # => 'İ'
'ı'.upcase(Unicode::CaseOptions::Turkic)   # => 'I'
