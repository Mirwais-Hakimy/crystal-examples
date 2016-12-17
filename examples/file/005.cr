# file.cr:62
File.open(File::DEVNULL) do |file|
  file.puts "this is discarded"
end
