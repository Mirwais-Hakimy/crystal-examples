# crystal/main.cr:20
require "crystal/main"
fun main(argc : Int32, argv : UInt8**) : Int32
  Crystal.main do
    elapsed = Time.measure do
      Crystal.main_user_code(argc, argv)
    end
    puts "Time to execute program: #{elapsed}"
  end
end
