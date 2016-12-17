require "spec"

it "unicode/unicode.cr" do
puts # :nocode:

puts "# unicode/unicode.cr:18 (001.cr)" # :nocode: :example:
( 'İ'.downcase(Unicode::CaseOptions::Turkic) ).should eq( 'i' )
( 'I'.downcase(Unicode::CaseOptions::Turkic) ).should eq( 'ı' )
( 'i'.upcase(Unicode::CaseOptions::Turkic) ).should eq( 'İ' )
( 'ı'.upcase(Unicode::CaseOptions::Turkic) ).should eq( 'I' )


end
