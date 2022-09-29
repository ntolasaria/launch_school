def greetings(arr, hash)
  name = arr.join(' ')
  occupation = hash[:title] + ' ' + hash[:occupation]
  puts "Hello, #{name}! Nice to have a #{occupation} around."
end

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
# => Hello, John Q Doe! Nice to have a Master Plumber around.
