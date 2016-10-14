require './e02_methods.rb'
require './morse.rb'

MORSE[" "] = " "

def build_hash_from(keys, values)
    res = {}
    (0..keys.size).each do |index|
        res[keys[index]] = values[index] unless keys[index].nil?
    end
    res
end

def encode(str)
    str.downcase.chars.map do |chr|
        MORSE[chr] if MORSE.keys.include?(chr)
    end.join "|"
end

def decode(str)
    str.split("|").map do |part|
        MORSE.key part if MORSE.values.include?(part)
    end.join
end
