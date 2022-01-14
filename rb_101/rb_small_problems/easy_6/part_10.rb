def triangle(length)
  (1..length).each do |line|
    puts "#{' ' * (length - line)}#{'*' * line}"
  end
end

triangle(9)