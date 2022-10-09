# def count(array)
#   true_count = 0
#   array.each { |el|true_count += 1 if yield(el) }
#   true_count
# end

# Without each, loop, while or until

def count(array)
  max_idx = array.size - 1
  true_count = 0

  (0..max_idx).each do |idx|
    true_count += 1 if yield(array[idx])
  end

  true_count
end

p count([1,2,3,4,5]) { |value| value.odd? } == 3
p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count([1,2,3,4,5]) { |value| true } == 5
p count([1,2,3,4,5]) { |value| false } == 0
p count([]) { |value| value.even? } == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2
