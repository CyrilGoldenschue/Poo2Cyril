class StatsMailObserver
  def initialize(stats_filename)
    @stats_filename = stats_filename
    @received_count = 0
    @rejected_count = 0
  end
  
  def mail_received(mail)
    @received_count += 1
    update_stats
  end
  
  def mail_rejected(mail)
    @rejected_count += 1
    update_stats
  end

  def mail_stored(mail)
  end

  protected
  
  def update_stats
    File.open(@stats_filename, "w") do |file|
      file.puts "Received count: #{@received_count}"
      file.puts "Rejected count: #{@rejected_count}"
      file.puts "Spam ratio: #{@rejected_count * 100 / @received_count}%"
    end
  end
end
