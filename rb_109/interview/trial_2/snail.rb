require 'pry-byebug'

def snail(array)
  snail_arr = []
  x, y = 0, 0
  x_increment, y_increment = 1, 1
  x_axis = true
  
  loop do
    if x_axis
      x += x_increment if array[y][x] == nil
      loop do
        # binding.pry
        snail_arr << array[y][x] #if !array[y][x]
        array[y][x] = nil
        if array[y][x + x_increment] == nil
          x_increment *= -1
          break
        else
          x += x_increment
        end
      end
    else
      y += y_increment if array[y][x] == nil
      loop do
        # binding.pry
        snail_arr << array[y][x] #if array[y][x]
        array[y][x] = nil
        if y == (array.size - 1) || array[y + y_increment][x] == nil
          y_increment *= -1
          break
        else
          y += y_increment
        end
      end
    end
    x_axis = !x_axis
    break if array.all? { |arr| arr.all? { |n| n == nil} }
  end

    
snail_arr
end

# def snail(array)
#   snail_arr = []
#   x_axis = true
#   x_size = array.size - 1
#   y_size = array.size - 1
#   x, y = 0, 0
#   loop do
#     if x_axis
#       x.upto(x_size) do |idx|
#         snail_arr << array[y][x]
#         array[y][x] = nil







# end




p snail([[1,2,3],[4,5,6],[7,8,9]])