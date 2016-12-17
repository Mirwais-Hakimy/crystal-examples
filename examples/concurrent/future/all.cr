# concurrent/future.cr: 3 examples

# concurrent/future.cr:122 (001.cr)
d = delay(1) { Process.kill(Signal::KILL, Process.pid) }
# ... long operations ...
d.cancel

# concurrent/future.cr:133 (002.cr)
f = future { `echo hello` }
# ... other actions ...
f.get # => "hello\n"

# concurrent/future.cr:145 (003.cr)
# pending by 'file:pendings/concurrent/future/003.cr'
# l = lazy { expensive_computation }
# spawn { maybe_use_computation(l) }
# spawn { maybe_use_computation(l) }
