# # def welcome(str)
# #   suffix = yield if block_given?
# #   str + ' ' + suffix
# # end

# def welcome(str)
#   puts str + ' ' + block.call
# end

# welcome('Hello') { 'there' } # => Hello there
# # welcome('Hey') { 'Joe' } # => Hey Joe


# def true_or_false(&block)
#   p block
#   puts "The block is #{block.call}"
# end

# true_or_false { 5 > 8 }

# def call_chunk(code_chunk)
#   code_chunk.call
# end

# color = "blue"
# say_color = Proc.new { puts "The color is #{color}" }
# call_chunk(say_color)

ARRAY = [1, 2, 3]

def abc
  a = 3
end

def xyz(collection)
  collection.map { |x| yield x }
end

xyz(ARRAY) do |n|
  puts a
end