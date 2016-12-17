# kernel.cr:78
ARGV.replace ["file1"]
ARGF.gets_to_end # => Content of file1
ARGV             # => []
ARGV << "file2"
ARGF.gets_to_end # => Content of file2
