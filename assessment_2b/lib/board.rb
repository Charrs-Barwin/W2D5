class Board
    attr :max_height
    def self.build_stacks(n)
        Array.new(n){Array.new}
    end

    def initialize(st_num,st_hgt)
        @max_height = st_hgt
        @stacks = Board.build_stacks(st_num)
        raise 'rows and cols must be >= 4' if [st_num,st_hgt].any?{|n|n<4}
    end

    def add(t,st_i)
        return false if @stacks[st_i].size >= @max_height
        @stacks[st_i] << t
        true
    end

    def vertical_winner?(t)
        @stacks.any?{|s|s.size == @max_height && s.uniq == [t]}
    end

    def horizontal_winner?(t)
        (0...@max_height).each do |i|
            return false if @stacks.any?{|s|s.size<=i}
            return true if @stacks.all?{|s|s[i]==t}
        end
        false
    end

    def winner?(t)
        vertical_winner?(t) || horizontal_winner?(t)
    end

    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    def print
        @stacks.each { |stack| p stack }
    end
end
