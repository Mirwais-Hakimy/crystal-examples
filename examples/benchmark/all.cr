# benchmark.cr: 5 examples
require "benchmark"

# benchmark.cr:8 (001.cr)
require "benchmark"

Benchmark.ips do |x|
  x.report("short sleep") { sleep 0.01 }
  x.report("shorter sleep") { sleep 0.001 }
end

# benchmark.cr:28 (002.cr)
Benchmark.ips(warmup: 4, calculation: 10) do |x|
  x.report("sleep") { sleep 0.01 }
end

# benchmark.cr:38 (003.cr)
require "benchmark"

puts Benchmark.measure { "a"*1_000_000_000 }

# benchmark.cr:56 (004.cr)
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

# benchmark.cr:133 (005.cr)
# pending by 'file:pendings/benchmark/005.cr'
# Benchmark.realtime { "a" * 100_000 } # => 00:00:00.0005840
