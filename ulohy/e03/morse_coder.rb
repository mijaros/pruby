class MorseCoder
    @@morse = {
     "a" => ".-",
     "b" => "-...",
     "c" => "----",
     "d" => "-..",
     "e" => ".",
     "f" => "..-.",
     "g" => "--.",
     "h" => "....",
     "i" => "..",
     "j" => ".---",
     "k" => "-.-",
     "l" => ".-..",
     "m" => "--",
     "n" => "-.",
     "o" => "---",
     "p" => ".--.",
     "q" => "--.-",
     "r" => ".-.",
     "s" => "...",
     "t" => "-",
     "u" => "..-",
     "v" => "...-",
     "w" => ".--",
     "x" => "-..-",
     "y" => "-.--",
     "z" => "--..",
     " " => " "
    }

    attr_reader :separator

    def initialize(separator = "|")
        @separator = separator
    end

    def encode(str)
        str.downcase.chars.map do |chr|
            @@morse[chr] if @@morse.keys.include?(chr)
        end.join separator
    end

    def decode(str)
        str.split(separator).map do |part|
            @@morse.key part if @@morse.values.include?(part)
        end.join
    end
end

class VerifiableMorseCoder < MorseCoder
    def verify(ver_str)
        return ver_str == decode(encode(ver_str))
    end
end
