module Examples::Info
  GIT_VERSION = "gen/git_version.txt"

  # "0.25.1+14 [cc182ce78]"
  def self.crystal_git
    File.read(GIT_VERSION).chomp
  end

  # "0.25.1+14"
  def self.crystal_tag
    ary = crystal_git.split(/\s/)
    return ary.first{ "master" }
  end

  # "0.25.1"
  def self.crystal_ver
    tag = crystal_tag
    return tag.split(/\+/).first? || tag
  end
end
