# kernel.cr:273
sprintf "%g", 123.4          # => "123.4"
sprintf "%g", 123.4567       # => "123.457"
sprintf "%20.8g", 1234.56789 # => "           1234.5679"
sprintf "%20.8g", 123456789  # => "       1.2345679e+08"
sprintf "%20.8G", 123456789  # => "       1.2345679E+08"
sprintf "%20.8g", -123456789 # => "       -1.2345679e+08"
sprintf "%20.8G", -123456789 # => "       -1.2345679E+08"
