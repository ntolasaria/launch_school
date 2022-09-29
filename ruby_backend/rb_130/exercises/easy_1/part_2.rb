# def compute
#   return "Does not compute." unless block_given?
#   yield
# end

# p compute { 5 + 3 } == 8
# p compute { 'a' + 'b' } == 'ab'
# p compute == 'Does not compute.'

# Further exploration

def compute(arg)
  return "Does not compute." unless block_given?
  yield(arg)
end

p compute(3) { |n| n**2 } == 9
p compute('abc') { |s| s.upcase } == 'ABC'
p compute(3) == 'Does not compute.'