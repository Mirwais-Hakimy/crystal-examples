# benchmark.cr:56
require "benchmark"

n = 5000000
Benchmark.bm do |x|
  x.report("times:") do
    n.times do
      a = "1"
    end
  end
  x.report("upto:") do
    1.upto(n) do
      a = "1"
    end
  end
end
