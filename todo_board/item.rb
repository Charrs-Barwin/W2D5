class Item

    def self.valid_date?(date_string)
        nums = date_string.split('-')
        return false if !( nums.count == 3 && nums.all?{|n|n.include?(n.to_i.to_s)} )
        nums.map!(&:to_i)
        p nums
        return false if nums[1]>12 || nums[2]>31 || [nums[1],nums[2]].any?{|n|n<1}
        true
    end
    
    attr_reader :title, :deadline, :description
    attr_writer :title, :description
    def initialize(title, deadline, description)
        raise "invalid date" if !Item.valid_date?(deadline)
        @title, @deadline, @description = title, deadline, description
    end

    def deadline=(new_deadline)
        raise "invalid date" if !Item.valid_date?(new_deadline)
        @deadline = new_deadline
    end

end