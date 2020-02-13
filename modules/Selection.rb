module Selection
    @prompt = TTY::Prompt.new

    def self.selection(arguments_for_selection)
        @prompt.select("What's your answer?", arguments_for_selection)
    end

    def self.yer_or_no(text)
        @prompt.yes?(text)
    end
end