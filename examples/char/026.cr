# char.cr:400
'z'.upcase { |v| puts v } # prints 'Z'
'ﬄ'.upcase { |v| puts v } # prints 'F', 'F', 'L'
