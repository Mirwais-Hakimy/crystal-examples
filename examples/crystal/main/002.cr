# crystal/main.cr:65
require "crystal/main"
fun main(argc : Int32, argv : UInt8**) : Int32
  # some setup before Crystal main
  Crystal.main(argc, argv)
  # some cleanup logic after Crystal main
end
