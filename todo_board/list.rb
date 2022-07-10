require_relative "item"

class List
    attr_reader :label
    def initialize(label)
        @label = label
        @items = []
    end

    def label=(new_label)
        @label = new_label
    end

    def add_item(title, deadline, *description="")
        if Item.valid_date?(deadline)
            @items << Item.new(title, deadline, description.join(" "))
            return true
        end

        false
    end

    def size
        @items.length
    end

    def valid_index?(index)
        if index < size && index > -1
            return true
        end

        false
    end

    def swap(index_1, index_2)  
        if valid_index?(index_1) && valid_index?(index_2)
            @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
            return true
        end

        false
    end

    def [](index)
        return nil if valid_index?(index) == false
        @items[index]
    end

    def priority
        return nil if size == 0
        @items[0]
    end

    def print
        p "------------------------------------------"
        p "                #{@label}                "
        p "Index | Item                 | Deadline"
        p "------------------------------------------"
        @items.each_with_index do |ele, indx|
            p "#{indx}     | #{ele.title}" + " " * (21 - ele.title.length) +"| #{ele.deadline}".lstrip
        end

        p "------------------------------------------"
    end

    def print_full_item(index)
        if  valid_index?(index)
            p "------------------------------------------"
            p "#{@items[index].title}" + " " * (32-@items[index].title.length) + "#{@items[index].deadline}"
            p @items[index].description
            p "------------------------------------------"
        end
    end

    def print_priority
        print_full_item(0)
    end

    def up(index, amount=1)
        return false if valid_index?(index) == false
        return nil if self.[](index) == self.priority
        
        (1..amount).each do |i|
            return true if self.[](index) == self.priority
            swap(index, index - 1)
            index -= 1
        end

        true
    end

    def down(index, amount=1)
        return false if valid_index?(index) == false
        return nil if index == size - 1

        (1..amount).each do |i|
            return false if index == size - 1
            swap(index, index + 1)
            index += 1
        end

        true
    end

    def sort_by_date!
        @items.sort_by! { |ele| ele.deadline}
    end
end




















