# def bubble_sort!(array, &block)
#   block = Proc.new { |a, b| a <= b } unless block

#   loop do
#     swap_status = false
    
#     0.upto(array.size - 2) do |index|
#       if !block.call(array[index], array[index + 1])
#         array[index], array[index + 1] = array[index + 1], array[index]
#         swap_status = true
#       end
#     end

#     break unless swap_status
#   end
# end

# array = [5, 3]
# bubble_sort!(array)
# p array == [3, 5]

# array = [5, 3, 7]
# bubble_sort!(array) { |first, second| first >= second }
# p array == [7, 5, 3]

# array = [6, 2, 7, 1, 4]
# bubble_sort!(array)
# p array == [1, 2, 4, 6, 7]

# array = [6, 12, 27, 22, 14]
# bubble_sort!(array) { |first, second| (first % 7) <= (second % 7) }
# p array == [14, 22, 12, 6, 27]

# array = %w(sue Pete alice Tyler rachel Kim bonnie)
# bubble_sort!(array)
# p array == %w(Kim Pete Tyler alice bonnie rachel sue)

# array = %w(sue Pete alice Tyler rachel Kim bonnie)
# bubble_sort!(array) { |first, second| first.downcase <= second.downcase }
# p array == %w(alice bonnie Kim Pete rachel sue Tyler)

# Further exploration

def bubble_sort!(array, &block)
  block = Proc.new { |el| el } unless block

  loop do
    swap_status = false
    
    0.upto(array.size - 2) do |index|
      if block.call(array[index]) > block.call(array[index + 1])
        array[index], array[index + 1] = array[index + 1], array[index]
        swap_status = true
      end
    end

    break unless swap_status
  end
end


array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array) { |value| value.downcase }
p array == %w(alice bonnie Kim Pete rachel sue Tyler)

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array)
p array #== %w(alice bonnie Kim Pete rachel sue Tyler)
