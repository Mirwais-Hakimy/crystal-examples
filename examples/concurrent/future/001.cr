# concurrent/future.cr:122
d = delay(1) { Process.kill(Signal::KILL, Process.pid) }
# ... long operations ...
d.cancel
