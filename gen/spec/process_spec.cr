require "spec"

it "process.cr" do
puts # :nocode:

puts "# process.cr:493 (001.cr)" # :nocode: :example:
# pending by 'file:pendings/process/001.cr' # :pending:
# Process.chroot("/var/empty")

puts "# process.cr:526 (002.cr)" # :nocode: :example:
system("echo *")

puts "# process.cr:547 (003.cr)" # :nocode: :example:
( `echo hi` ).to_s.should eq( "hi\n" )


end
