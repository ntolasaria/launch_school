hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

arr = []

hsh.each_value do |val_hash|
  if val_hash[:type] == 'fruit'
    arr << val_hash[:colors].map {|color| color.capitalize}
  else
    arr << val_hash[:size].upcase
  end
end

# result = arr.map do |el|
#   if el.class == Array
#     el.map {|color| color.capitalize}
#   else
#     el.upcase
#   end
# end

p arr

