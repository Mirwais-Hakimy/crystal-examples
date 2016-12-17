# concurrent.cr: 5 examples

# concurrent.cr:38 (001.cr)
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

# concurrent.cr:72 (002.cr)
i = 0
while i < 5
  spawn { print(i) }
  i += 1
end
Fiber.yield
# Output: 55555

# concurrent.cr:84 (003.cr)
i = 0
while i < 5
  spawn print(i)
  i += 1
end
Fiber.yield
# Output: 01234

# concurrent.cr:141 (004.cr)
def say(word)
  puts word
end

# Will print out the three words concurrently
parallel(
  say("concurrency"),
  say("is"),
  say("easy")
)

# concurrent.cr:157 (005.cr)
def concurrent_job(word)
  word
end

a, b, c =
  parallel(
    concurrent_job("concurrency"),
    concurrent_job("is"),
    concurrent_job("easy")
  )

a # => "concurrency"
b # => "is"
c # => "easy"
