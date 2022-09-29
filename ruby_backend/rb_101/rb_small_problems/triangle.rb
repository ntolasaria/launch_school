def triangle(length)
  index = 1
  while index <= length
    puts "#{' ' * (length - index)}#{'*' * index}"
    index += 1
  end
end

triangle(9)
