require './bike.rb'
require './morse_coder.rb'

a = Bike.new 3, 7, "ahoj", "blue", 187

100.times { puts a.action; a.get_current }
puts a.get_current
puts a.distance
puts "--------------------"
puts a.front_gear_up!.rear_gear_up!.go!.distance
puts a.get_current
puts a.front_gear_up!.rear_gear_down!.go!.distance
puts a.get_current
