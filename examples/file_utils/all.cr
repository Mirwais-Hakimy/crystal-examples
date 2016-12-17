# file_utils.cr: 30 examples
require "file_utils"

# file_utils.cr:6 (001.cr)
require "file_utils"

FileUtils.cd("/tmp")

# file_utils.cr:20 (002.cr)
FileUtils.cd("/tmp") { Dir.current } # => "/tmp"

# file_utils.cr:32 (003.cr)
File.write("file.cr", "1")
File.write("bar.cr", "1")
FileUtils.cmp("file.cr", "bar.cr") # => true

# file_utils.cr:50 (004.cr)
File.write("afile", "123")
stream1 = File.open("afile")
stream2 = IO::Memory.new("123")
FileUtils.cmp(stream1, stream2) # => true

# file_utils.cr:75 (005.cr)
FileUtils.touch("afile.cr")

# file_utils.cr:89 (006.cr)
FileUtils.touch(["foo", "bar"])

# file_utils.cr:102 (007.cr)
File.chmod("afile", 0o600)
FileUtils.cp("afile", "afile_copy")
File.info("afile_copy").permissions.value # => 0o600

# file_utils.cr:119 (008.cr)
Dir.mkdir("files")
FileUtils.cp({"bar.cr", "afile"}, "files")

# file_utils.cr:133 (009.cr)
FileUtils.cp_r("files", "dir")

# file_utils.cr:152 (010.cr)
# pending by 'file:pendings/file_utils/010.cr'
# # Create a hard link, pointing from /usr/bin/emacs to /usr/bin/vim
# FileUtils.ln("/usr/bin/vim", "/usr/bin/emacs")
# # Create a hard link, pointing from /tmp/foo.c to foo.c
# FileUtils.ln("foo.c", "/tmp")

# file_utils.cr:169 (011.cr)
# pending by 'file:pendings/file_utils/011.cr'
# # Create /usr/bin/vim, /usr/bin/emacs, and /usr/bin/nano as hard links
# FileUtils.ln(["vim", "emacs", "nano"], "/usr/bin")

# file_utils.cr:184 (012.cr)
# Create a symbolic link pointing from logs to /var/log
FileUtils.ln_s("/var/log", "logs")
# Create a symbolic link pointing from /tmp/src to src
FileUtils.ln_s("src", "/tmp")

# file_utils.cr:201 (013.cr)
# pending by 'file:pendings/file_utils/013.cr'
# # Create symbolic links in src/ pointing to every .c file in the current directory
# FileUtils.ln_s(Dir["*.c"], "src")

# file_utils.cr:216 (014.cr)
# Create a symbolic link pointing from bar.c to foo.c, even if bar.c already exists
FileUtils.ln_sf("foo.c", "bar.c")

# file_utils.cr:234 (015.cr)
# pending by 'file:pendings/file_utils/015.cr'
# # Create symbolic links in src/ pointing to every .c file in the current directory,
# # even if it means overwriting files in src/
# FileUtils.ln_sf(Dir["*.c"], "src")

# file_utils.cr:250 (016.cr)
# pending by 'file:pendings/file_utils/016.cr'
# FileUtils.mkdir("src")

# file_utils.cr:262 (017.cr)
# pending by 'file:pendings/file_utils/017.cr'
# FileUtils.mkdir(["foo", "bar"])

# file_utils.cr:275 (018.cr)
# pending by 'file:pendings/file_utils/012.cr'
# FileUtils.mkdir_p("foo")

# file_utils.cr:288 (019.cr)
# pending by 'file:pendings/file_utils/019.cr'
# FileUtils.mkdir_p(["foo", "bar", "baz", "dir1", "dir2", "dir3"])

# file_utils.cr:299 (020.cr)
FileUtils.mv("afile", "afile.cr")

# file_utils.cr:310 (021.cr)
# pending by 'file:pendings/file_utils/021.cr'
# FileUtils.mv(["foo", "bar"], "src")

# file_utils.cr:325 (022.cr)
FileUtils.pwd

# file_utils.cr:336 (023.cr)
FileUtils.rm("afile.cr")

# file_utils.cr:347 (024.cr)
FileUtils.rm(["dir/afile", "afile_copy"])

# file_utils.cr:359 (025.cr)
FileUtils.rm_r("dir")
FileUtils.rm_r("file.cr")

# file_utils.cr:378 (026.cr)
FileUtils.rm_r(["files", "bar.cr"])

# file_utils.cr:391 (027.cr)
FileUtils.rm_rf("dir")
FileUtils.rm_rf("file.cr")
FileUtils.rm_rf("non_existent_file")

# file_utils.cr:407 (028.cr)
FileUtils.rm_rf(["dir", "file.cr", "non_existent_file"])

# file_utils.cr:421 (029.cr)
# pending by 'file:pendings/file_utils/023.cr'
# FileUtils.rmdir("baz")

# file_utils.cr:432 (030.cr)
# pending by 'file:pendings/file_utils/024.cr'
# FileUtils.rmdir(["dir1", "dir2", "dir3"])
