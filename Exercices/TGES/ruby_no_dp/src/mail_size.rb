module SpamHandlers
    class Stats
      def initialize(config)
        @stats_filename = File.readlines(config['stats_path'], chomp: true)
        @fileOpen = File.open(@stats_filename, "w")
      end
      
      def count(received_count, rejected_count)
        @fileOpen do |file|
            file.puts "Received count: #{@received_count}"
            file.puts "Rejected count: #{@rejected_count}"
            file.puts "Spam ratio: #{@rejected_count * 100 / @received_count}%"
        end

      def size(size_stocked, size_rejected)


        @fileOpen do |file|
            file.puts "Total size stocked :  #{@size_stocked } "
            file.puts "Total size rejected :  #{@size_rejected } "
        end


      end
    end
  end
  