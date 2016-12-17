# logger.cr:56
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
