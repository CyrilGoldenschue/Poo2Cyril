# This class is a `Wrapper` around particular SMTP implementation

# this one wraps `rumbster`
require 'rumbster'
require 'mail'

class SmtpConnector
  def initialize(port:, mail_server:)
    @mail_server = mail_server
    @rumbster = Rumbster.new(port)
    @rumbster.add_observer(self)
  end
  
  def run
    @rumbster.start
    @rumbster.join
  end

  def update(string_message)
    @mail_server.receive(Mail.read_from_string(string_message))
  end
end
