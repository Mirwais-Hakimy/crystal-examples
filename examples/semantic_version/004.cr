# semantic_version.cr:111
require "semantic_version"

prerelease = SemanticVersion::Prerelease.parse("rc.1.3")
prerelease # => SemanticVersion::Prerelease(@identifiers=["rc", 1, 3])
