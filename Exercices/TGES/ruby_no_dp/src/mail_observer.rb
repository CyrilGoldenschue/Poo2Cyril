class TheServer
    def initialize
      @stats_filename = "data/stats.txt"
      
      @received_count = 0
      @rejected_count = 0
  
      @size_stocked = 0
      @size_rejected = 0
    end

    def rejected()
        puts "Rejected mail: #{mail.from} #{mail.to}"
        @rejected_count += 1
        @size_rejected += string_message.bytesize
        final()
    end

    def received()
        puts "Received mail: #{mail.from} #{mail.to}"
        @received_count += 1
        final()
    end

    def stored()
        puts "Stored mail: #{mail.from} #{mail.to}"
        @size_stocked += string_message.bytesize
        final()
    end
    
    def final()
        File.open(@stats_filename, "w") do |file|
            file.puts "Received count: #{@received_count}"
            file.puts "Rejected count: #{@rejected_count}"
            file.puts "Spam ratio: #{@rejected_count * 100 / @received_count}%"
            file.puts "Total size stocked :  #{@size_stocked } "
            file.puts "Total size rejected :  #{@size_rejected } "
          end
    end

    
end