# Input - array
# Output - array - sorted

# Methods available - 
# `merge` -> merges to sorted arrays in order 



def merge(array1, array2)
  result = []
  index = 0
  array1.each do |num1|
    while index < array2.size && array2[index] < num1
      result << array2[index]
      index += 1
    end
    result << num1
  end
  result += array2[index..-1]
end


def merge_sort(array)
  return array if array.size < 2
  array1 = array[0...(array.size / 2)]
  array2 = array[(array.size / 2)..-1]

  array1 = merge_sort(array1)
  array2 = merge_sort(array2)

  merge(array1, array2)
end

# Without recursion

# Algorithm - 



# def merge_sort(array)
#   array = array.map { |el| [el] }

#   index = 0 

#   loop do




# end







p merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
p merge_sort([5, 3]) == [3, 5]
p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]