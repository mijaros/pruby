module Logger1
  def log
    puts 'log1'
  end
end

module Logger2
  def log
    puts 'log2'
  end
end

class Counter
  include Logger1
  include Logger2

  #def log
  #  puts 'counter'
  end
end

class SubCounter < Counter
  include Logger2

  #def log
  #  puts 'subcounter'
  #end
end

Counter.new.log
#SubCounter.new.log
