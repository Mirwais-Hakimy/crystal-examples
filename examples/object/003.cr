# object.cr:67
def hash(hasher)
  hasher = @some_ivar.hash(hasher)
  hasher = @some_other_ivar.hash(hasher)
  hasher
end
