require "../examples"
require "opts"
require "shard"

CommentSpec::Default::IGNORED_METHODS << "modification_time"

class Main
  include Opts

  VERSION = Shard.version
  PROGRAM = Shard.program

  option crystal  : String , "-c CRYSTAL_BIN", "Specify crystal", "crystal"
  option noabort  : Bool   , "-E", "Disable abort on first Error", false
  option limit    : Int32  , "-l NUM", "Max operation count (almost file numbers)", 65535
  option noreq    : Bool   , "-R", "Disable Embedding require code into example (only gen)", false
  option noskip   : Bool   , "-S", "Disable Skip error commented lines (only gen)", false
  option dryrun   : Bool   , "-n", "Just run for dry-run mode", false
  option verbose  : Bool   , "-v", "Verbose output", false
  option version  : Bool   , "--version", "Print the version and exit", false
  option help     : Bool   , "--help"   , "Output this help and exit" , false

  USAGE = <<-EOF
    {{program}} version {{version}}

    Usage: {{program}} <command>

    Options:
    {{options}}

    Commands:
      cache        lookup cache entry for the file (ex. 'cache:spec get foo.cr')
      check        check comment format of examples
      compile      test to compile all examples
      count        print a count of examples
      gen          generate examples and specs from sources
      gitbook      generate gitbook sources
      pending      mark the example as pending
      sha1         print sha1 digest for a code in the file
      show         print example codes from given src
      spec         print spec code from given src
      version      print crystal src version
    EOF

  def run
    cmd  = args.shift { die "command not found!" }
    prog = Examples::Program.new(config)

    case cmd
    when /^cache:c(|ompile)$/ then prog.cache(:compile, args.shift, args.shift)
    when /^cache:s(|pec)$/    then prog.cache(:spec, args.shift, args.shift)
    when "check"   then prog.check(src)
    when "compile" then prog.compile(crystal, limit)
    when "count"   then prog.count(src)
    when "gen"     then prog.gen(src)
    when "gitbook" then prog.gitbook(limit, dryrun)
    when "pending" then prog.pending(src)
    when "sha1"    then prog.sha1(src)
    when "show"    then prog.show(src)
    when "spec"    then prog.spec(src)
    when "version" then prog.version
    else ; die "command not supported: #{cmd} "
    end
  end

  private def src
    args.shift { die "please give a src file" }
  end

  private def config
    TOML::Config.parse("").tap do |c|
      c["verbose"]  = verbose
      c["failfast"] = !noabort
      c["autoreq"]  = !noreq
      c["skiperr"]  = !noskip
    end
  end
end

Main.run
