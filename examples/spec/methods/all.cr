# spec/methods.cr: 3 examples
require "spec/methods"

# spec/methods.cr:8 (001.cr)
describe "Int32" do
  describe "+" do
    it "adds" { (1 + 1).should eq 2 }
  end
end

# spec/methods.cr:33 (002.cr)
it "adds" { (1 + 1).should eq 2 }

# spec/methods.cr:65 (003.cr)
pending "check cat" { cat.alive? }
