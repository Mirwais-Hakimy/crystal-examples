require "spec"
require "benchmark"
it "benchmark.cr" do
puts # :nocode:

puts "# benchmark.cr:8 (001.cr)" # :nocode: :example:
# require "benchmark"

Benchmark.ips do |x|
  x.report("short sleep") { sleep 0.01 }
  x.report("shorter sleep") { sleep 0.001 }
end

puts "# benchmark.cr:28 (002.cr)" # :nocode: :example:
Benchmark.ips(warmup: 4, calculation: 10) do |x|
  x.report("sleep") { sleep 0.01 }
end

puts "# benchmark.cr:38 (003.cr)" # :nocode: :example:
# require "benchmark"

puts Benchmark.measure { "a"*1_000_000_000 }

puts "# benchmark.cr:56 (004.cr)" # :nocode: :example:
# require "benchmark"

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

puts "# benchmark.cr:133 (005.cr)" # :nocode: :example:
# pending by 'file:pendings/benchmark/005.cr' # :pending:
# Benchmark.realtime { "a" * 100_000 } # => 00:00:00.0005840


end
