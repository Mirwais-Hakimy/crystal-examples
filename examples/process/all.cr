# process.cr: 3 examples

# process.cr:493 (001.cr)
# pending by 'file:pendings/process/001.cr'
# Process.chroot("/var/empty")

# process.cr:526 (002.cr)
system("echo *")

# process.cr:547 (003.cr)
`echo hi` # => "hi\n"
