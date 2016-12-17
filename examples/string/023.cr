# string.cr:639
"123.45e1".to_f?                # => 1234.5
"45.67 degrees".to_f?           # => nil
"thx1138".to_f?                 # => nil
" 1.2".to_f?(whitespace: false) # => nil
"1.2foo".to_f?(strict: false)   # => 1.2
