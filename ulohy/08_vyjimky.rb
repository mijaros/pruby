def format_string(string)
  string.upcase!
rescue NoMethodError => e
  puts "DEBUG: String does not respond to upcase!"
ensure
  return string || 'DEFAULT'
end

puts format_string('test')
puts format_string(nil)

#begin
#  raise
#ensure
#  puts 'always printed'
#end
