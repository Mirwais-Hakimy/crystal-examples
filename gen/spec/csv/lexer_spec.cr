require "spec"
require "csv"
it "csv/lexer.cr" do
puts # :nocode:

puts "# csv/lexer.cr:6 (001.cr)" # :nocode: :example:
# require "csv"

lexer = CSV::Lexer.new "one,two\nthree"
( lexer.next_token ).to_s.should eq( "CSV::Token(@kind=Cell, @value=\"one\")" )
( lexer.next_token ).to_s.should eq( "CSV::Token(@kind=Cell, @value=\"two\")" )
( lexer.next_token ).to_s.should eq( "CSV::Token(@kind=Newline, @value=\"two\")" )
( lexer.next_token ).to_s.should eq( "CSV::Token(@kind=Cell, @value=\"three\")" )
( lexer.next_token ).to_s.should eq( "CSV::Token(@kind=Eof, @value=\"three\")" )


end
