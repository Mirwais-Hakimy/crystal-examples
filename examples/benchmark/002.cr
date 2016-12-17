# benchmark.cr:28
require "benchmark"
Benchmark.ips(warmup: 4, calculation: 10) do |x|
  x.report("sleep") { sleep 0.01 }
end
