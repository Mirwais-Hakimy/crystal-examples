require "spec"
require "file_utils"
it "file_utils.cr" do
puts # :nocode:

puts "# file_utils.cr:6 (001.cr)" # :nocode: :example:
# require "file_utils"

FileUtils.cd("/tmp")

puts "# file_utils.cr:20 (002.cr)" # :nocode: :example:
( FileUtils.cd("/tmp") { Dir.current } ).to_s.should eq( "/tmp" )

puts "# file_utils.cr:32 (003.cr)" # :nocode: :example:
File.write("file.cr", "1")
File.write("bar.cr", "1")
( FileUtils.cmp("file.cr", "bar.cr") ).should eq( true )

puts "# file_utils.cr:50 (004.cr)" # :nocode: :example:
File.write("afile", "123")
stream1 = File.open("afile")
stream2 = IO::Memory.new("123")
( FileUtils.cmp(stream1, stream2) ).should eq( true )

puts "# file_utils.cr:75 (005.cr)" # :nocode: :example:
FileUtils.touch("afile.cr")

puts "# file_utils.cr:89 (006.cr)" # :nocode: :example:
FileUtils.touch(["foo", "bar"])

puts "# file_utils.cr:102 (007.cr)" # :nocode: :example:
File.chmod("afile", 0o600)
FileUtils.cp("afile", "afile_copy")
( File.info("afile_copy").permissions.value ).should eq( 0o600 )

puts "# file_utils.cr:119 (008.cr)" # :nocode: :example:
Dir.mkdir("files")
FileUtils.cp({"bar.cr", "afile"}, "files")

puts "# file_utils.cr:133 (009.cr)" # :nocode: :example:
FileUtils.cp_r("files", "dir")

puts "# file_utils.cr:152 (010.cr)" # :nocode: :example:
# pending by 'file:pendings/file_utils/010.cr' # :pending:
# # Create a hard link, pointing from /usr/bin/emacs to /usr/bin/vim
# FileUtils.ln("/usr/bin/vim", "/usr/bin/emacs")
# # Create a hard link, pointing from /tmp/foo.c to foo.c
# FileUtils.ln("foo.c", "/tmp")

puts "# file_utils.cr:169 (011.cr)" # :nocode: :example:
# pending by 'file:pendings/file_utils/011.cr' # :pending:
# # Create /usr/bin/vim, /usr/bin/emacs, and /usr/bin/nano as hard links
# FileUtils.ln(["vim", "emacs", "nano"], "/usr/bin")

puts "# file_utils.cr:184 (012.cr)" # :nocode: :example:
# Create a symbolic link pointing from logs to /var/log
FileUtils.ln_s("/var/log", "logs")
# Create a symbolic link pointing from /tmp/src to src
FileUtils.ln_s("src", "/tmp")

puts "# file_utils.cr:201 (013.cr)" # :nocode: :example:
# pending by 'file:pendings/file_utils/013.cr' # :pending:
# # Create symbolic links in src/ pointing to every .c file in the current directory
# FileUtils.ln_s(Dir["*.c"], "src")

puts "# file_utils.cr:216 (014.cr)" # :nocode: :example:
# Create a symbolic link pointing from bar.c to foo.c, even if bar.c already exists
FileUtils.ln_sf("foo.c", "bar.c")

puts "# file_utils.cr:234 (015.cr)" # :nocode: :example:
# pending by 'file:pendings/file_utils/015.cr' # :pending:
# # Create symbolic links in src/ pointing to every .c file in the current directory,
# # even if it means overwriting files in src/
# FileUtils.ln_sf(Dir["*.c"], "src")

puts "# file_utils.cr:250 (016.cr)" # :nocode: :example:
# pending by 'file:pendings/file_utils/016.cr' # :pending:
# FileUtils.mkdir("src")

puts "# file_utils.cr:262 (017.cr)" # :nocode: :example:
# pending by 'file:pendings/file_utils/017.cr' # :pending:
# FileUtils.mkdir(["foo", "bar"])

puts "# file_utils.cr:275 (018.cr)" # :nocode: :example:
# pending by 'file:pendings/file_utils/012.cr' # :pending:
# FileUtils.mkdir_p("foo")

puts "# file_utils.cr:288 (019.cr)" # :nocode: :example:
# pending by 'file:pendings/file_utils/019.cr' # :pending:
# FileUtils.mkdir_p(["foo", "bar", "baz", "dir1", "dir2", "dir3"])

puts "# file_utils.cr:299 (020.cr)" # :nocode: :example:
FileUtils.mv("afile", "afile.cr")

puts "# file_utils.cr:310 (021.cr)" # :nocode: :example:
# pending by 'file:pendings/file_utils/021.cr' # :pending:
# FileUtils.mv(["foo", "bar"], "src")

puts "# file_utils.cr:325 (022.cr)" # :nocode: :example:
FileUtils.pwd

puts "# file_utils.cr:336 (023.cr)" # :nocode: :example:
FileUtils.rm("afile.cr")

puts "# file_utils.cr:347 (024.cr)" # :nocode: :example:
FileUtils.rm(["dir/afile", "afile_copy"])

puts "# file_utils.cr:359 (025.cr)" # :nocode: :example:
FileUtils.rm_r("dir")
FileUtils.rm_r("file.cr")

puts "# file_utils.cr:378 (026.cr)" # :nocode: :example:
FileUtils.rm_r(["files", "bar.cr"])

puts "# file_utils.cr:391 (027.cr)" # :nocode: :example:
FileUtils.rm_rf("dir")
FileUtils.rm_rf("file.cr")
FileUtils.rm_rf("non_existent_file")

puts "# file_utils.cr:407 (028.cr)" # :nocode: :example:
FileUtils.rm_rf(["dir", "file.cr", "non_existent_file"])

puts "# file_utils.cr:421 (029.cr)" # :nocode: :example:
# pending by 'file:pendings/file_utils/023.cr' # :pending:
# FileUtils.rmdir("baz")

puts "# file_utils.cr:432 (030.cr)" # :nocode: :example:
# pending by 'file:pendings/file_utils/024.cr' # :pending:
# FileUtils.rmdir(["dir1", "dir2", "dir3"])


end
