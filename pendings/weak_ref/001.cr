# weak_ref.cr:3
ref = WeakRef.new("oof".reverse)
p ref.value # => "foo"
GC.collect
p ref.value # => nil
