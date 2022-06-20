class ValidateAgeError < StandardError; end

def validate_age(age)
  raise ValidateAgeError, "invalid age" unless (0..105).include?(age)
end

begin
  puts "Enter an age:"
  age = gets.chomp.to_i
  attempts ||= 0
  validate_age(age)
rescue ValidateAgeError => e
  attempts += 1
  p e
  puts e.message  
  retry if attempts < 3
end
