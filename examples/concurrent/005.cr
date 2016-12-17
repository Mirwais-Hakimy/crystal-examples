# concurrent.cr:157
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
