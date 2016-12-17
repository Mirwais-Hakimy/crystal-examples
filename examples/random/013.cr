# random.cr:343
Random::Secure.urlsafe_base64                    # => "MAD2bw8QaBdvITCveBNCrw"
Random::Secure.urlsafe_base64(8, padding: true)  # => "vvP1kcs841I="
Random::Secure.urlsafe_base64(16, padding: true) # => "og2aJrELDZWSdJfVGkxNKw=="
