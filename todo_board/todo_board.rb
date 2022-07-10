require "byebug"
require_relative "list"

class TodoBoard
    def initialize(label)
        @list = List.new(label)
    end

    def get_command
        print "\nEnter a command: "
        cmd, *args = gets.chomp.split(' ')

        case cmd
        when 'mktodo'
            @list.add_item(args[0], args[1], args[2..-1].join(' '))
        when 'up'
            if args.length > 1
                @list.up(args[0].to_i, args[1].to_i)
            else
                @list.up(args[0].to_i)
            end
        when 'down'
            if args.length > 1
                @list.down(args[0].to_i, args[1].to_i)
            else
                @list.down(args[0].to_i)
            end
        when 'swap'
            @list.swap(args[0].to_i, args[1].to_i)
        when 'sort'
            @list.sort_by_date!
        when 'priority'
            @list.print_full_item(0)
        when 'print'
            if !args.empty?
                @list.print_full_item(args[0].to_i)
            else
                @list.print
            end
        when 'quit'
            return false
        else
            print "Sorry, that command is not recognized."
        end

        true
    end

    def run
        i = true
        while i
            i = get_command
        end
    end
end