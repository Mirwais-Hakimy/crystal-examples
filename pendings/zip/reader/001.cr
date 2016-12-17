# zip/reader.cr:13
require "zip/reader"
File.open("./file.zip") do |file|
  Zip::Reader.open(file) do |zip|
    zip.each_entry do |entry|
      p entry.filename
      p entry.file?
      p entry.dir?
      p entry.io.gets_to_end
    end
  end
end
