def select_letter(string, letter)
  selected_chars = ''
  counter = 0

  loop do
    break if counter == string.size
    selected_chars << string[counter] if string[counter] == letter
    counter += 1
  end

  selected_chars
  end

  question = 'How many times does a particular character appear in this sentence?'
  p select_letter(question, 'a').size
  p select_letter(question, 't').size
  p select_letter(question, 'z').size

