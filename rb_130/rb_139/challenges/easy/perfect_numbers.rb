class PerfectNumber
  def self.classify(number)
    raise StandardError if number < 1

    case divisors_sum(number) <=> number
    when -1 then 'deficient'
    when 0  then 'perfect'
    when 1  then 'abundant'
    end
  end

  class << self
    private
    
    def divisors_sum(number)
      divisors = [1]
      2.upto(Math.sqrt(number)) do |num|
        if number % num == 0
          divisors << num
          divisors << number / num
        end
      end
      divisors.sum
    end
  end
end