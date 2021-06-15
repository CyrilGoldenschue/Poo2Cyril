class LoggerMailObserver
  def mail_received(mail)
    puts "Received mail: #{mail.from} #{mail.to}"
  end
  
  def mail_rejected(mail)
    puts "Rejected mail: #{mail.from} #{mail.to}"
  end
  
  def mail_stored(mail)
    puts "Stored mail: #{mail.from} #{mail.to}"
  end
end
