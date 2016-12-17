require "./spec_helper"

private def parse(code)
  SourceParser.parse("(test)", IO::Memory.new(code))
end

describe SourceParser do
  describe ".parse" do
    it "builds comments" do
      try = parse <<-EOF
        # ```
        # Array(Int32).new  # => []
        # ```
        ...
        # ```crystal
        # [] of Int32 # same as Array(Int32)
        # ```
        EOF
      try.success?.should be_true
      try.get.comments.size.should eq(2)
      try.get.comments.map(&.type).should eq(["", "crystal"])
    end

    it "fails when unspected end" do
      try = parse <<-EOF
        # ```
        # a = [1]
        # a.pop { "Testing" } #=> 1
        # a.pop { "Testing" } #=> "Testing"
        def pop
        end
        EOF
      try.failure?.should be_true
      try.failed.value.should be_a(Errors::UnexpectedEnd)
    end
  end
end
