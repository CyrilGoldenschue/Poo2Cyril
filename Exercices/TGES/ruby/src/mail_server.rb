class MailServer
  def initialize(config:)
    @config = config

    @observers = []

    @spam_blocker = SpamBlocker.new
    Array(@config.dig('spam_blocker', 'handlers')).each do |name, its_config|
      @spam_blocker.add_handler(SpamHandlers.const_get(name).new(its_config))
    end
  end
  
  def subscribe(observer)
    @observers.push(observer)
  end
  
  def unsubscribe(observer)
    @observers.delete(observer)
  end

  # Called for every incoming mail as a Mail object
  def receive(mail)
    notify_observers(:mail_received, mail)
    
    if @spam_blocker.should_block?(mail)
      notify_observers(:mail_rejected, mail)
      return
    end
    
    dispatch(mail)
    notify_observers(:mail_stored, mail)
  end
  
  protected
  
  def dispatch(mail)
    mail.to.each do |recipient|
      target_dir = File.join(@config["store_location"], recipient)
      Dir.mkdir(target_dir) unless Dir.exist?(target_dir)
      File.write(File.join(target_dir, "#{Time.now.to_i}.eml"), mail.raw_source)
    end
  end
  
  def notify_observers(event, payload)
    @observers.each {|observer| observer.send(event, payload) }
  end
end
