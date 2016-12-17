# signal.cr: 1 examples

# signal.cr:12 (001.cr)
puts "Ctrl+C still has the OS default action (stops the program)"
sleep 3

Signal::INT.trap do
  puts "Gotcha!"
end
puts "Ctrl+C will be caught from now on"
sleep 3

Signal::INT.reset
puts "Ctrl+C is back to the OS default action"
sleep 3
