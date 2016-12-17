# concurrent.cr:141
def say(word)
  puts word
end

# Will print out the three words concurrently
parallel(
  say("concurrency"),
  say("is"),
  say("easy")
)
