# logger.cr: 2 examples
require "logger"

# logger.cr:15 (001.cr)
require "logger"

log = Logger.new(STDOUT)
log.level = Logger::WARN

# or
log = Logger.new(STDOUT, level: Logger::WARN)

log.debug("Created logger")
log.info("Program started")
log.warn("Nothing to do!")

begin
  File.each_line("/foo/bar.log") do |line|
    unless line =~ /^(\w+) = (.*)$/
      log.error("Line in wrong format: #{line}")
    end
  end
rescue err
  log.fatal("Caught exception; exiting")
  log.fatal(err)
end

# logger.cr:56 (002.cr)
require "logger"

logger = Logger.new(STDOUT)
logger.progname = "YodaBot"

logger.formatter = Logger::Formatter.new do |severity, datetime, progname, message, io|
  label = severity.unknown? ? "ANY" : severity.to_s
  io << label[0] << ", [" << datetime << " #" << Process.pid << "] "
  io << label.rjust(5) << " -- " << progname << ": " << message
end

logger.warn("Fear leads to anger. Anger leads to hate. Hate leads to suffering.")

# Prints to the console:
# "W, [2017-05-06 18:00:41 -0300 #11927]  WARN --
#  YodaBot: Fear leads to anger. Anger leads to hate. Hate leads to suffering."
