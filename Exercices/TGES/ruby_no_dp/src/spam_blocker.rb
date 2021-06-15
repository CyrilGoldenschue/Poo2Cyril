
class SpamBlocker
    def initialize
        @blockers = [];
      end
      
      def addBlocker(blocker)
        @blockers.push(blocker);
      end

      def shouldBlock(email)
        block = false;

        @blockers.each do |blocker|
            block |= blocker.shouldBlock(email);
        end

        return block;
    end


      def should_block?(mail)
        mail.destinations.none? {|destination| @white_regexp.match(destination) }
      end
      
      def should_block?(mail)
          !mail.attachments.none? {|attachment| /.rar/.match(attachment.filename) }
      end









end
