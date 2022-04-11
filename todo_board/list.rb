require_relative "item.rb"
class List
    attr_accessor :label
    def initialize(label)
        @label, @items = label, []
    end

    def add_item(title,deadline,description="")
        return false if !Item.valid_date?(deadline)
        @items<<Item.new(title,deadline,description)
        true
    end

    def size
        @items.count
    end

    def valid_index?(index)
        index >= 0 && index < @items.count
    end

    def swap(i1, i2)
        return false if [i1,i2].any?{|i|!valid_index?(i)}
        @items[i1],@items[i2] = @items[i2],@items[i1]
        true
    end

    def[](i)
        return nil if !valid_index?(i)
        @items[i]
    end

    def priority
        @items.first
    end
    
    def print
        @items.each_with_index{|e,i|puts i.to_s + '\t' + e.title + '\t\t' + e.deadline}
    end

    def print_full_item(i)
        puts @items[i].title + "\t\t\t\t\t" + @items[i].deadline + '\n' + @items[i].description if valid_index?(i)
    end

    def print_priority
        print_full_item(priority)
    end

    def up(index,amount=1)
        return false if !valid_index?(index)
        return if amount == 0 || !valid_index?(index+1)
        swap(index,index+1)
        up(index+1,amount-1)
        true
    end

    def down(index,amount=1)
        return false if !valid_index?(index)
        return if amount == 0 || !valid_index?(index-1)
        swap(index,index-1)
        down(index-1,amount-1)
        true
    end
end