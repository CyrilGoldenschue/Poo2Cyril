port = (ARGV[0] || 3325).to_i

require 'rumbster'
require 'mail'

require_relative 'src/spam_handlers/bad_words'
require_relative 'src/spam_handlers/recipient_whitelist'
require_relative 'src/spam_handlers/bad_extension'

class TheServer
  def initialize
    @bad_words_handler = SpamHandlers::BadWords.new({'words_list_path' => "bad_words_list.txt"})
    @recipient_whitelist_handler = SpamHandlers::RecipientWhitelist.new({'white_regexp' => "@(cpnv.ch|vd.ch)$"})
    @bad_extension_handler = SpamHandlers::BadExtensions.new()
    
    @stats_filename = "data/stats.txt"
    @store_location = "data"
    
    @received_count = 0
    @rejected_count = 0

    @size_stocked = 0
    @size_rejected = 0
  end
  
  def update(string_message)
    mail = Mail.read_from_string(string_message)
    
    puts "Received mail: #{mail.from} #{mail.to}"
    @received_count += 1

    if @bad_words_handler.should_block?(mail) || @recipient_whitelist_handler.should_block?(mail) || @bad_extension_handler.should_block?(mail) 
      puts "Rejected mail: #{mail.from} #{mail.to}"
      @rejected_count += 1
      p @size_rejected += string_message.bytesize
    else
      puts "Stored mail: #{mail.from} #{mail.to}"
      @size_stocked += string_message.bytesize
      mail.to.each do |recipient|
        target_dir = File.join(@store_location, recipient)
        Dir.mkdir(target_dir) unless Dir.exist?(target_dir)
        File.write(File.join(target_dir, "#{Time.now.to_i}.eml"), mail.raw_source)
      end
    end
    File.open(@stats_filename, "w") do |file|
      file.puts "Received count: #{@received_count}"
      file.puts "Rejected count: #{@rejected_count}"
      file.puts "Spam ratio: #{@rejected_count * 100 / @received_count}%"
      file.puts "Total size stocked :  #{@size_stocked } "
      file.puts "Total size rejected :  #{@size_rejected } "
    end
  end
  
end

rumbster = Rumbster.new(port)
rumbster.add_observer(TheServer.new)
rumbster.start
rumbster.join
