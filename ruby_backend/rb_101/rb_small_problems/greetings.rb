def greetings(arr, hash)
  puts "=> Hello #{arr.join(' ')}! Nice to have a #{hash.values.join(' ')} around."
end

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
# => Hello, John Q Doe! Nice to have a Master Plumber around.