require 'pry-byebug'

def queue_time(customers, n)
  #your code here
  queue = [0] * n
  time = 0
  until customers == []
    queue.map! do |counter|
      if counter == 0
        cust = customers.shift
        break if cust == nil
        cust
      else
         counter
      end
    end
    if !queue.include?(0)
      # binding.pry
      min_time = queue.min
      time += min_time
      queue.map! { |counter| counter - min_time }
    end
  end
  time += queue.max
end


# p queue_time([], 1) == 0
# p queue_time([5], 1) == 5
# p queue_time([2], 5) == 2
# p queue_time([1, 2, 3, 4, 5], 1) == 15
# p queue_time([1, 2, 3, 4, 5], 100) == 5
# p queue_time([2, 2, 3, 3, 4, 4], 2) == 9
p queue_time([29, 2, 142, 29, 97], 2)