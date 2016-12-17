# logger.cr:15
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
