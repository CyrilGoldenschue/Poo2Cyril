class SpamBlocker
  def initialize
    @handlers = []
  end
  
  def add_handler(handler)
    @handlers.push(handler)
  end
  
  def should_block?(mail)
    @handlers.any? {|handler| handler.should_block?(mail) }
  end
end
