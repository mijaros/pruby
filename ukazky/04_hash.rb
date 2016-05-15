morse = { 'a' => '._', 'b' => '__..', 'c' => '_._.' }
morse['b'] # => '__..'
morse[2]   # => nil
morse[2] = 'x'
morse[2]   # => 'x'
