# concurrent/future.cr:146
l = lazy { expensive_computation }
spawn { maybe_use_computation(l) }
spawn { maybe_use_computation(l) }
