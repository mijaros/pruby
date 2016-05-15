[ 'a', 'b', 'c', 'd' ].size # => 4
[ 1, 'a' ].reverse          # => [ 'a', 1 ]
[].empty?                   # => true
[ 1, 2, 3 ][2]              # => 3
[ 1, 2, 3 ].push('x')       # => [ 1, 2, 3, 'x' ]

Array.new(2)      # => [ nil, nil ]
Array.new(2, 'x') # => [ 'x', 'x' ]

[ nil ] + [ 1, 2 ]     # => [ nil, 1, 2 ]
[ nil, 1, 2 ].compact  # => [ 1, 2 ]
[ [ ], [ [ 1 ] ], 3 ].flatten  # => [ 1, 3 ]
[ 1, 2, 2, 3 ].uniq    # => [ 1, 2, 3 ]

[ 'a', 'b', 'c' ].join("\n") # => "a\nb\nc\n"
