# semantic_version.cr:138
require "semantic_version"

semver = SemanticVersion.parse("0.27.1-rc.1")
semver.prerelease.to_s # => "rc.1"
