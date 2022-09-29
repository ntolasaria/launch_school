# Class - PerfectNumber

# Required - class method - `classify`

# Input - integer
# Output  - string 
#         - 'deficient', 'perfect', 'abundant' based on the rules below:

# sum of all positive divisors
# - < number - deficient
# - > number - abundant
# - = number - perfect

# constructor:
# - 1 argument - integer

# method: `classify`

# - classify the number based on the above criteria,
# - return string
# - use helper methods if required

# class PerfectNumber
#   attr_reader :number

#   def initialize(number)
#     raise StandardError, 'number must be greater than 0' if number < 1
#     @number = number
#   end

#   def classify
#     case aliquot_sum <=> number
#     when -1 then 'deficient'
#     when 0  then 'perfect'
#     when 1  then 'abundant'
#     end
#   end

#   def self.classify(number)
#     PerfectNumber.new(number).classify
#   end

#   private

#   def aliquot_sum
#     sum = 0
#     (1..number/2).each do |n|
#       sum += n if number % n == 0
#     end
#     sum
#   end
# end

# Using class method and private class method

class PerfectNumber
  def self.classify(number)
    raise StandardError, 'Number should be greater than 0!' if number < 1

    case aliquot_sum(number) <=> number
    when -1 then 'deficient'
    when 0  then 'perfect'
    when 1  then 'abundant'
    end
  end

  class << self
    private

    # Iterating to the square root for optimisation
    def aliquot_sum(number)
      divisors = []
      (1..Math.sqrt(number).to_i).each do |n|
        if number % n == 0
          divisors << n
          divisors << number / n if n > 1 
        end
      end
      divisors.uniq.sum
    end
  end
end
