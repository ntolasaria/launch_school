# Class: SumOfMultiples

# constructor: 
# - optional argument list - default 3, 5 - multiples

# methods: `to`
# - 1 arugument - integer
# - return sum of all all the multiples in the multiples provided by constructor
# - duplicates to not be added twice


class SumOfMultiples
  def initialize(*divisors)
    @divisors = divisors.empty? ? [3, 5] : divisors 
  end

  def to(max_num)
    (1...max_num).select do |n|
      @divisors.any? { |div| n % div == 0 }
    end.sum
  end

  def self.to(max_num)
    SumOfMultiples.new.to(max_num)
  end
end