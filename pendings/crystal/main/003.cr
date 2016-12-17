# crystal/main.cr:82
require "crystal/main"
fun main(argc : Int32, argv : UInt8**) : Int32
  LibFoo.init_foo_and_invoke_main(argc, argv, ->Crystal.main)
end
