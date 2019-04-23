module Enumerable

    def my_each
        i = 0
        if self.class == Array
            while i < self.length do
                yield(self[i])
                i += 1
            end
        elsif self.class == Hash
            while i < self.length do
                yield(self.keys[i], self.values[i])
                i += 1
            end
        end
    end

    def my_each_with_index
        i = 0
        if self.class == Array
            while i < self.length do
                yield(i, self[i])
                i += 1
            end
        elsif self.class == Hash 
            while i < self.length do 
                yield(self.keys[i], self.values[i], i)
                i += 1
            end
        end
    end

    def my_select
        i = 0
        if self.class == Array
            new_array = []
            self.my_each do |value|
                if yield(value)
                    new_array << value
                end
            end
            return new_array
        elsif self.class == Hash 
            new_hash = {}
            self.my_each do |key, value|
                if yield(key, value)
                    new_hash[key] = value
                end
            end
            return new_hash
        end
    end

    def my_all?
        i = 0
        result = true
        if self.class == Array 
            self.my_each do |value|
                unless yield(value)
                    result = false
                end
            end
        elsif self.class == Hash
            self.my_each do |key, value|
                unless yield(key, value)
                    result = false
                end
            end
        end
        return result
    end

    def my_any?
        i = 0
        result = false
        if self.class == Array
            self.my_each do |value|
                if yield(value)
                    result = true
                end
                i += 1
            end
        elsif self.class == Hash
            self.my_each do |key, value|
                if yield(key, value)
                    result = true
                end
            end
        end
        return result
    end

    def my_none? 
        i = 0
        result = true
        if self.class == Array
            self.my_each do |value|
                if yield(value)
                    result = false
                end
            end
        elsif self.class == Hash 
            self.my_each do |value|
                if yield(value) 
                    result = false
                end
            end
        end
        result
    end

    def my_count var
        count = 0
        if self.class == Array
            self.my_each do |value|
                if value == var
                    count +=1
                end
            end
        elsif self.class == Hash 
            self.my_each do |value|
                if value == var
                    count +=1
                end
            end
        end
        count
    end

    def my_map
        if self.class == Array
            new_array = []
            self.my_each do |value|
                new_array << yield(value)
            end
            return new_array
        elsif self.class == Hash
            new_hash = {}
            self.my_each do |key, value|
                new_array[key] = yield(value)
            end
            return new_hash
        end
    end

    def my_inject i = 0
        result = self[i]
        i += 1
        if self.class == Array
            while i < self.length do 
                result = yield(result, self[i])
                i += 1
            end
        elsif self.class == Hash 
            while i < self.length do
                result = yield(total, self.keys[i], self.values[i])
                i += 1
            end
        end
        result
    end
end








array = [1, 2, 3, 4, 5, 2]
hash = { 1 => 10, 2 => 15, 3 => 12, 4 => 5}
# print array.my_each {|element| puts element}
print hash.my_each {|key, value| puts value}
# print array.my_each_with_index {|key, value| 
#     print key
#     print " => "
#     print value
#     print "\n"

# }

# print array.my_select {|value|value > 2 }

# print array.my_all? { |value| value > 12}

# print array.my_any? { |value| value > 12}

# print array.my_none? { |value| value > 11}

# print array.my_count(1)

# print array.my_map { |value| value + 2}

# def multiply_els(arr)
#     arr.my_inject {|total, value| total * value}
# end

# print multiply_els([2,4,5])