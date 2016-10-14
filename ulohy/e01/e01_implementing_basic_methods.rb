# returns true if +a and +b substrings are separated by +separator in a +string
# returns false otherwise
# see http://ruby-doc.org/core/String.html for help
def separated_by?(string, a, b, separator)
    if a == nil || b == nil || separator == nil || string == nil
        return false
    end
    string.include?(a+separator+b) || string.include?(b+separator+a)
end

# returns true if +string reads the same way from both ends, e.g. krk
# returns false otherwise
def palindrom?(string)
    return false unless string.instance_of? String
    string == string.reverse
end

# return count of palindroms in +array
def palindroms_count(array)
    return 0 if array.nil?
    k = 0
    array.each do |p|
        k += 1 if palindrom? p
    end
    k
end

# returns true if +number is power of 2, e.g. 4, 8, 16
# returns false otherwise
def power_of_2?(number)
    return number.to_s(2).match(/\A10*\Z/)
end

# returns a hash, +keys is an array of keys, +values is an array of values
# so that build_hash_from([1, 'a'], ['one', 'A']) will return { 1 => 'one', 'a' => 'A' }
# hash should have as many entries as keys, if there are no values for keys use nil
def build_hash_from(keys, values)
    res = {}
    (0..keys.size).each do |index|
        res[keys[index]] = values[index] unless keys[index].nil?
    end
    res
end


