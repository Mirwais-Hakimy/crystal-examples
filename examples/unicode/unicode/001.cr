# unicode/unicode.cr:18
'İ'.downcase(Unicode::CaseOptions::Turkic) # => 'i'
'I'.downcase(Unicode::CaseOptions::Turkic) # => 'ı'
'i'.upcase(Unicode::CaseOptions::Turkic)   # => 'İ'
'ı'.upcase(Unicode::CaseOptions::Turkic)   # => 'I'
