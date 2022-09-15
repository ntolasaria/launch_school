def a_method(num, &block)
  if block_given?
    block.call(5)
  else
    puts "No block given, the number is: #{num}"
  end
end


a_method(5)
a_method(5) { |n| puts n * n }