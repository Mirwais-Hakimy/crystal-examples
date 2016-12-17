# crystal/main.cr: 3 examples
require "crystal/main"

# crystal/main.cr:20 (001.cr)
fun main(argc : Int32, argv : UInt8**) : Int32
  Crystal.main do
    elapsed = Time.measure do
      Crystal.main_user_code(argc, argv)
    end
    puts "Time to execute program: #{elapsed}"
  end
end

# crystal/main.cr:65 (002.cr)
fun main(argc : Int32, argv : UInt8**) : Int32
  # some setup before Crystal main
  Crystal.main(argc, argv)
  # some cleanup logic after Crystal main
end

# crystal/main.cr:75 (003.cr)
# pending by 'file:pendings/crystal/main/003.cr'
# fun main(argc : Int32, argv : UInt8**) : Int32
#   LibFoo.init_foo_and_invoke_main(argc, argv, ->Crystal.main)
# end
