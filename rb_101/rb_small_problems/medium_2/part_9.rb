

def bubble_sort!(array)
  size = array.size
  loop do
    idx = 0
    sort_status = false
    loop do
      if array[idx] > array[idx + 1]
        array[idx], array[idx + 1] = array[idx + 1], array[idx]
        sort_status = true
      end

        idx += 1
        break if idx == (size - 1)
    end

    break if !sort_status 
  end
  array
end

array = [5, 3]
p bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
p bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
p bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

