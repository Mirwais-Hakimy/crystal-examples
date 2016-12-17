require "../spec_helper"

private macro src(v)
  src = {{v}}
end

private macro dst(v)
  Generator::ExampleBuilder.build(src).should eq({{v}})
end

describe Generator::ExampleBuilder do
  describe "#build" do
    it "skip errors" do
      src "[] # compile error"
      dst "# [] # compile error"
    end

    it "as is (default)" do
      src "1"
      dst "1"
    end
  end
end
