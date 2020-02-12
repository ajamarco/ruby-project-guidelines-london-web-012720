module Dialog
    def self.dialog(text)
        puts text.red
        arr_to_selection = ["That's my name", "This is none of your business", "Hey! Long time no see!"]
        Selection.selection(arr_to_selection)
    end
end
