
def no_dupes?(arr)
    arr.select{|e|arr.count(e)==1}
end

def no_consecutive_repeats?(arr)
    arr[1..-1].each_with_index{|e,i|return false if e==arr[i]}
    true
end

def char_indices(str)
    h = Hash.new{|h,k|h[k]=[]}
    str.each_char.with_index{|c,i|h[c]<<i}
    h
end

def longest_streak(str)
    result = ""
    str[0..-1].each_char.with_index do |c,i|
        next if i > 0 && c == str[i-1]
        streak = ""+c
        count = 1
        while i+count < str.length && c==str[i+count]
            streak << str[i+count]
            count += 1
        end
        result = streak if streak.length >= result.length
    end
    result
end

