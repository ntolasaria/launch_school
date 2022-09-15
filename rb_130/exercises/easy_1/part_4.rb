# def divisors(num)
#   (1..num).select { |n| num % n == 0 }
# end

def divisors(num)
  limit = Math.sqrt(num).to_i
  result = []
  (1..limit).each do |n|
    if num % n == 0
      result << n
      result << (num / n)
    end
  end
  result.sort.uniq
end

def time_method
  start = Time.new
  yield
  finish = Time.new
  finish - start
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p time_method { divisors(99400891) == [1, 9967, 9973, 99400891] } # may take a minute