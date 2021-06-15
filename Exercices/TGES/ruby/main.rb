require "zeitwerk"
loader = Zeitwerk::Loader.new
loader.push_dir(File.join(__dir__, "src"))
loader.setup

require_relative 'logger_mail_observer'
require_relative 'stats_mail_observer'

require 'yaml'
config = YAML.load_file("config.yml")

mail_server = MailServer.new(config: config)
mail_server.subscribe(LoggerMailObserver.new)
mail_server.subscribe(StatsMailObserver.new(config["stats_filename"]))

SmtpConnector.new(port: config["port"], mail_server: mail_server).run
