def my_each array
    i = 0
    while i < array.length do
        yield(array[i])
        i += 1
    end
    
end

def my_each_with_index array 
    i = 0
    while i < array.length do
        yield(i, array[i])
        i += 1
    end
end

def my_select array 
    i = 0
    new_array = []
    while i < array.length do
        if yield(array[i])
            new_array << array[i]
        end
        i += 1
    end
    new_array
end

def my_all? array
    i = 0
    result = true
    while i < array.length do
        unless yield(array[i])
            result = false
        end
        i += 1
    end
    return result
end

def my_any? array
    i = 0
    result = false
    while i < array.length do
        if yield(array[i])
            result = true
        end
        i += 1
    end
    return result
end

def my_none? array
    i = 0
    result = true
    while i < array.length do
        if yield(array[i])
            result = false
        end
        i += 1
    end
    result
end

def my_count array
    i = 0 
    count = 0
    while i < array.length do 
        if yield() == array[i]
            count +=1
        end
        i += 1
    end
    count
end

def my_map array 
    i = 0
    new_array = []
    while i < array.length do
        new_array << yield(array[i])
        i += 1
    end
    new_array
end

def my_inject array, i = 0
    result = array[i]
    i += 1
    while i < array.length do 
        result = yield(result, array[i])
        i += 1
    end
    result
end


array = [1, 2, 3, 4, 5, 2]
# print my_each(array) {|element| puts element}
# print my_each_with_index(array) {|index, element| 
#     print index
#     print " =>"
#     print element
#     print " "

# }

# print my_select(array) {|value|value > 2 }

# print my_all?(array) { |value| value > 2}

# print my_any?(array) { |value| value > -1}

# print my_none?(array) { |value| value > 4}

# print my_count(array) { 3 }

# print my_map(array) { |value| value + 2}

def multiply_els(arr)
    my_map(arr) {|total, value| total * value}
end

print multiply_els([2,4,5])