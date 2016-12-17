# benchmark.cr:8
require "benchmark"

Benchmark.ips do |x|
  x.report("short sleep") { sleep 0.01 }
  x.report("shorter sleep") { sleep 0.001 }
end
