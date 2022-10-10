def a_method(str, &block)
  p block_given?
end

a_method("hello") { |word| puts word.upcase }