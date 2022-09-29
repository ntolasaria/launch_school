# Input - array
# Output - same array - mutated - sorted (bubble sort)

# Rules -
# bubble sort:
# - iterate through the array, compare adjacent elements, swap if unsorted.
# - must mutate the original array

# Algorithm
# - start loop
#   - iterate through elements of the array 
#   - compare every pairs on each iteration
#     - if the pair is unsorted, i.e., a > b, then swap the elements
#   - break if none of the elements required sorting  
# - end loop


def bubble_sort!(array)
  counter = 0
  loop do
    p array
    swap_status = false
    0.upto(array.size - 2) do |index|
      counter += 1
      if array[index] > array[index + 1]
        swap_status = true
        array[index], array[index + 1] = array[index + 1], array[index]
      end
    end
    break unless swap_status
  end
  puts "number of iterations: #{counter}"
end

# Optimised


# def bubble_sort!(array)
#   last_index = array.size - 2
#   counter = 0
#   loop do
#     p array
#     swap_status = false
#     0.upto(last_index) do |index|
#       counter += 1
#       if array[index] > array[index + 1]
#         swap_status = true
#         array[index], array[index + 1] = array[index + 1], array[index]
#       end
#     end
#     last_index -= 1
#     break unless swap_status
#   end
#   puts "number of iterations: #{counter}"

# end



# array = [5, 3]
# p bubble_sort!(array)
# p array == [3, 5]

# array = [6, 2, 7, 1, 4]
# p bubble_sort!(array)
# p array == [1, 2, 4, 6, 7]

# array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
# p bubble_sort!(array)
# p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

array = (0..10).to_a.shuffle
bubble_sort!(array)
p array