# bez joinu nestihnou vlakna dobehnout
5.times do |i|
  Thread.new { puts i }
end






# pockame na dokonceni vlaken ktere probiha paralelne
threads = []
5.times do |i|
  threads.push Thread.new { puts i }
end
threads.each { |t| t.join }








# pockame na dokonceni vlaken ktere probiha paralelne
threads = []
5.times do |i|
  t = Thread.new { Thread.stop; puts i }
  threads.push t
  t.priority = i # cim vetsi i tim vetsi priorita
end
threads.each { |t| t.run }
threads.each { |t| t.join }
# threads.each { |t| t.run; t.join } # pozor, vysledek vzdy 0 1 2 3 4









# necekane zmeny
variable = 'hello'
t = Thread.new { variable = 'world' }.join
puts variable # => 'world'







# pouziti bezpecnych lokalnich promennych
variable = 'hello'
t = Thread.new { |variable| p variable; variable = 'local change' } # => nil
puts variable # => 'hello'






# lokalni promenne inicializovane z vnejsich
variable = 'hello'
t = Thread.new(variable) { |variable| p variable; variable = 'local change' } # => 'hello'
puts variable # => 'hello'
