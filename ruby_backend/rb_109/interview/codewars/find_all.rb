def find_all(n, k)
  #your code here
return [] if (9 * k) < n
numbers = []
min_num = [1] * k

(n - k).times do 
  if min_num.max < 9
    min_num[min_num.index(min_num.max)] += 1 
  else
    min_num[min_num.count(9)] += 1
  end
end

p min_num = min_num.reverse.join.to_i
max_num = [0] * k
n.times { max_num[max_num.index(max_num.min)] += 1 }
max_num = max_num.reverse.join.to_i
count = 0
min_num.upto(max_num) { |num| count += 1 if num.digits.sum == n && num.digits.sort.reverse == num.digits }
[count, min_num, max_num]

end

p find_all(10, 3) == [8, 118, 334]
p find_all(27, 3) == [1, 999, 999]