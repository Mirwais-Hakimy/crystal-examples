# benchmark.cr:133
require "benchmark"
Benchmark.realtime { "a" * 100_000 } # => 00:00:00.0005840
