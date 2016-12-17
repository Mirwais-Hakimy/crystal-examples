# string.cr:1585
"aabbcc".tr("abc", "xyz") # => "xxyyzz"
"aabbcc".tr("abc", "x")   # => "xxxxxx"
"aabbcc".tr("a", "xyz")   # => "xxbbcc"
