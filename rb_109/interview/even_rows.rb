# Create even number rows and return sum of the row (int - input)

# [2],  -> 2
# [4, 6],   -> 10
# [8, 10, 12],  -> 30
# [14, 16, 18, 20] -> 68

def row_sum(n)
  rows = []
  num = 2
  1.upto(n) do |row_number|
    row = create_row(num, row_number)
    num = row.last + 2
    rows << row
  end
  rows.last.sum
end

def create_row(first_number, row_length)
  row = []
  num = first_number
  row_length.times do 
    row << num
    num += 2
  end
  row
end

p row_sum(1)
p row_sum(2)
p row_sum(3)
p row_sum(4)

