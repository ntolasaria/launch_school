TEXT = File.read('sample_doc.txt')

arr = TEXT.split(/[.?!]/)
arr.map! { |str| str.lstrip }
max_line = arr.max { |a, b| a.length <=> b.length }
puts max_line
puts "The no. of words is: #{max_line.split.size}"

