module SpamHandlers
  class BadExtensions
    def initialize()
    end
    
    def should_block?(mail)
        !mail.attachments.none? {|attachment| /.rar/.match(attachment.filename) }
    end
  end
end
