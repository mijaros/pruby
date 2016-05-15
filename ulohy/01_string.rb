# string length
"hello".size
"hello".length

# string manipulation
'hello'.upcase        # => 'HELLO'
'hello'.downcase      # => 'hello'
'hello'.empty?        # => false
''.empty?             # => true
'hello'.ljust(7)      # => 'hello  '
'hello'.ljust(7, '_') # => 'hello__'
'hello'.tr('l', 'x')  # => 'hexxo'
'hi' * 3              # => 'hihihi'

# string parsing
'hi'.start_with?('a') # => false
'hi'[0]               # => 'h'
'hi'[1]               # => 'i'
'hi'[2]               # => nil
'hi'[-1]              # => 'i'
'hi'[-2]              # => 'h'
'hi'[-3]              # => nil
'hello'[1..-1]        # => 'ello'

# converting
'100'.to_i            # => 100
'1010'.to_i(2)        # => 10
'test'.to_sym         # => :test

# spliting into arary
"a,b,c,d".split(',')  # => [ 'a', 'b', 'c', 'd' ]

"abc\n".chomp         # => 'abc'
"abc".chomp           # => 'abc'
'abc'.chop            # => 'ab'
