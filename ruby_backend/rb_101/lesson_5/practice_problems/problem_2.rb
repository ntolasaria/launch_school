books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

sorted_books = books.sort do |hash1, hash2|
  hash1[:published] <=> hash2[:published]
end

sorted_books2 = books.sort_by do |hash|
  hash[:published]
end


p sorted_books

p sorted_books2