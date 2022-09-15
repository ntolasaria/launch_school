file = File.open('agreement.txt')
text = file.read
p text = text.split(' ').map(&:downcase)
text = text.map { |word| word.delete('^a-zA-Z0-9') }
p text.count { |word| word == 'fulcrum' }
