# concurrent.cr:84
i = 0
while i < 5
  spawn print(i)
  i += 1
end
Fiber.yield
# Output: 01234
