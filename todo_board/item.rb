require "byebug"

class Item

    attr_reader :title, :deadline, :description
    def self.valid_date?(date_string)
        date_arr = date_string.split("-")
        return false if date_arr.length < 3
        
        if date_arr[0].length < 4 || date_arr[1].to_i > 12 || date_arr[2].to_i > 31
            return false
        end

        true
    end

    def initialize(title, deadline, description)
        unless Item.valid_date?(deadline) == true
            raise RuntimeError.new("deadline invalid date")
        end

        @title = title
        @deadline = deadline
        @description = description
    end

    def title=(new_tite)
        @title = new_tite
    end

    def deadline=(new_deadline)
        @deadline = new_deadline
    end

    def description=(new_description)
        @description = new_description
    end


end

