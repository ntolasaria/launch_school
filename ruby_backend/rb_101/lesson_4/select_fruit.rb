# def select_fruit(hash)
#   sub_hash = {}

#   hash.each do |key, val|
#     if val == 'Fruit'
#       sub_hash[key] = val
#     end
#   end
#   sub_hash
# end

def select_fruit(hash)
  hash_keys = hash.keys
  p hash_keys
  sub_hash = {}
  counter = 0

  loop do 
    break if counter == hash_keys.size

    current_key = hash_keys[counter]
    current_val = hash[current_key]


    if current_val == 'Fruit'
      sub_hash[current_key] = current_val
    end
    
    counter += 1
  end

  sub_hash
end


  produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

p select_fruit(produce)