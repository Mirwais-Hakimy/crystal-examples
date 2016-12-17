# string.cr:2797
"hello".rpartition("l")  # => {"hel", "l", "o"}
"hello".rpartition("x")  # => {"", "", "hello"}
"hello".rpartition(/.l/) # => {"he", "ll", "o"}
