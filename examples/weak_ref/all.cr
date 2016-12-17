# weak_ref.cr: 1 examples

# weak_ref.cr:3 (001.cr)
# pending by 'file:pendings/weak_ref/001.cr'
# ref = WeakRef.new("oof".reverse)
# p ref.value # => "foo"
# GC.collect
# p ref.value # => nil
