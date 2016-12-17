# range.cr:147
range = Xs.new(1)..Xs.new(10)
range.step(2) { |x| puts x }
puts
range.step(3) { |x| puts x }
