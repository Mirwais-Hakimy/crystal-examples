# concurrent.cr:38
# Write "1" every 1 second and "2" every 2 seconds for 6 seconds.

ch = Channel(Nil).new

spawn do
  6.times do
    sleep 1
    puts 1
  end
  ch.send(nil)
end

spawn do
  3.times do
    sleep 2
    puts 2
  end
  ch.send(nil)
end

2.times { ch.receive }
