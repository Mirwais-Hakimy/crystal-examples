# random.cr: 14 examples

# random.cr:6 (001.cr)
Random.rand    # => 0.167595
Random.rand(5) # => 2

# random.cr:13 (002.cr)
r = Random.new
r.rand      # => 0.0372991
r.next_bool # => true
r.next_int  # => 2223112

# random.cr:22 (003.cr)
rand     # => 0.293829
rand(10) # => 8

# random.cr:73 (004.cr)
Random.new.next_bool # => true

# random.cr:93 (005.cr)
r = Random.new
r.rand # => 0.167595
r.rand # => 0.0372991

# random.cr:107 (006.cr)
Random.new.rand(10)   # => 5
Random.new.rand(5000) # => 2243

# random.cr:248 (007.cr)
Random.new.rand(3.5)    # => 2.88938
Random.new.rand(10.725) # => 7.70147

# random.cr:264 (008.cr)
Random.new.rand(10..20)                 # => 14
Random.new.rand(Int64::MIN..Int64::MAX) # => -5297435808626736140

# random.cr:274 (009.cr)
Random.new.rand(6.2..21.768) # => 15.2989

# random.cr:294 (010.cr)
slice = Bytes.new(4) # => [0, 0, 0, 0]
Random.new.random_bytes(slice)
slice # => [217, 118, 38, 196]

# random.cr:316 (011.cr)
Random.new.random_bytes    # => [145, 255, 191, 133, 132, 139, 53, 136, 93, 238, 2, 37, 138, 244, 3, 216]
Random.new.random_bytes(4) # => [217, 118, 38, 196]

# random.cr:329 (012.cr)
Random::Secure.base64(4) # => "fK1eYg=="

# random.cr:343 (013.cr)
Random::Secure.urlsafe_base64                    # => "MAD2bw8QaBdvITCveBNCrw"
Random::Secure.urlsafe_base64(8, padding: true)  # => "vvP1kcs841I="
Random::Secure.urlsafe_base64(16, padding: true) # => "og2aJrELDZWSdJfVGkxNKw=="

# random.cr:360 (014.cr)
Random::Secure.hex    # => "05f100a1123f6bdbb427698ab664ff5f"
Random::Secure.hex(1) # => "1a"
