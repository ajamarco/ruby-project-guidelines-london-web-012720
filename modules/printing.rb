module Printing
    def self.printing(text, sleep_time = 0)
        text.each_char {|c| print c; sleep sleep_time}
        puts "\n"
    end

    def self.printing_dialog(text, sleep_time = 0)
        puts "\n"
        text.each_char {|c| print c.red; sleep sleep_time}
        puts "\n"
    end
end