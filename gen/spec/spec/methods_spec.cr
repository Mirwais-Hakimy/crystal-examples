require "spec"
require "spec/methods"
it "spec/methods.cr" do
puts # :nocode:

puts "# spec/methods.cr:8 (001.cr)" # :nocode: :example:
describe "Int32" do
  describe "+" do
    it "adds" { (1 + 1).should eq 2 }
  end
end

puts "# spec/methods.cr:33 (002.cr)" # :nocode: :example:
it "adds" { (1 + 1).should eq 2 }

puts "# spec/methods.cr:65 (003.cr)" # :nocode: :example:
pending "check cat" { cat.alive? }


end
