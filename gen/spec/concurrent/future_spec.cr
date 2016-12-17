require "spec"

it "concurrent/future.cr" do
puts # :nocode:

puts "# concurrent/future.cr:122 (001.cr)" # :nocode: :example:
d = delay(1) { Process.kill(Signal::KILL, Process.pid) }
# ... long operations ...
d.cancel

puts "# concurrent/future.cr:133 (002.cr)" # :nocode: :example:
f = future { `echo hello` }
# ... other actions ...
( f.get ).to_s.should eq( "hello\n" )

puts "# concurrent/future.cr:145 (003.cr)" # :nocode: :example:
# pending by 'file:pendings/concurrent/future/003.cr' # :pending:
# l = lazy { expensive_computation }
# spawn { maybe_use_computation(l) }
# spawn { maybe_use_computation(l) }


end
