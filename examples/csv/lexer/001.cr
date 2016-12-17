# csv/lexer.cr:6
require "csv"

lexer = CSV::Lexer.new "one,two\nthree"
lexer.next_token # => CSV::Token(@kind=Cell, @value="one")
lexer.next_token # => CSV::Token(@kind=Cell, @value="two")
lexer.next_token # => CSV::Token(@kind=Newline, @value="two")
lexer.next_token # => CSV::Token(@kind=Cell, @value="three")
lexer.next_token # => CSV::Token(@kind=Eof, @value="three")
