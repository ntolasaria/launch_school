# Problem 1
# flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

# flintstones_hash = {}

# flintstones.each_with_index do |name, index|
#   flintstones_hash[name] = index
# end

# p flintstones_hash

##

# Problem 2
# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
# age_sum = 0
# ages.each_value do |val|
#   age_sum += val
# end
# puts age_sum
# puts ages.values.inject(:+)
# puts ages.values.reduce(:+)
# puts ages.values.sum

##

# Problem 3
# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
# ages.select! {|key, value| value < 100}
# puts ages

# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
# ages.keep_if {|key, value| value < 100}
# puts ages

##

# Problem 4
# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
# puts ages.values.min

##

# Problem 5
# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
# flintstones.each do |name|
#   if name[0, 2] == 'Be'
#     puts flintstones.index(name)
#     break
#   end
# end

# puts flintstones.index { |name| name[0, 2] == 'Be' }

##

# Problem 6
# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
# flintstones.map! { |name| name[0, 3] }
# puts flintstones

##

# Problem 7
# statement = "The Flintstones Rock"
# frequency_hash = Hash.new(0)

# statement.chars do |char|
#   frequency_hash[char] += 1
# end

# puts frequency_hash

##

# Problem 9 
# def titleize(str)
#   arr = str.split
#   arr.each {|word| word.capitalize!}
#   arr.join(' ')
# end

# def titleize2(str)
#   str.split.map { |word| word.capitalize }.join(' ')
# end

# words = "the flintstones rock"
# puts titleize2(words)

##

# Problem 10
# munsters = {
#   "Herman" => { "age" => 32, "gender" => "male" },
#   "Lily" => { "age" => 30, "gender" => "female" },
#   "Grandpa" => { "age" => 402, "gender" => "male" },
#   "Eddie" => { "age" => 10, "gender" => "male" },
#   "Marilyn" => { "age" => 23, "gender" => "female"}
# }

# munsters.each do |key, hash|
#   if hash['age'] > 60 
#     hash['age_group'] = 'senior'
#   elsif hash['age'] > 18
#     hash['age_group'] = 'adult'
#   else
#     hash['age_group'] = 'kid'
#   end
# end
# with case statement
# munsters.each do |key, hash|
#   case hash['age']
#   when 0...18
#     hash['age_group'] = 'kid'
#   when 18...65
#     hash['age_group'] = 'adult'
#   else
#     hash['age_group'] = 'senior'
#   end
# end


# puts munsters
