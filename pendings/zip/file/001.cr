# zip/file.cr:8
require "zip/file"
Zip::File.open("./file.zip") do |file|
  # Iterate through all entries printing their filename and contents
  file.entries.each do |entry|
    p entry.filename
    entry.open do |io|
      p io.gets_to_end
    end
  end

  # Random access to entries by filename is also provided
  entry = file["some_file.txt"]
  entry.open do |io|
    p io.gets_to_end
  end
end
