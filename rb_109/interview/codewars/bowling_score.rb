# INPUT - string representing bowling frame scores
# OUTPUT - total score

# Example - 

# "X X X X X X X X X XXX" ->  300
# "11 11 11 11 11 11 11 11 11 11" -> 20

# For spare ('/')
# "9/ 54"
# score = (10 + 5) + (5 + 4) = 24

# For strike ('X')
# "X X 54"
# score = (10 + 10 + 5) + (10 + 5 + 4) + (5 + 4) = 53

# ALGORITHM - 
# split the string to get individual frames
# if the value is not spare or strike simply add the total tp bowling score
# if spare, add the preceding value to current turn
# if strike - add preceding two values to current turn
# continue for every turn
# ex :

# '1/ 11 11'

require 'pry-byebug'

def spare_score(arr, idx)
  score_str = arr[idx..-1].join
  if score_str[2] == 'X'
    20
  else
    10 + score_str[2].to_i
  end
end

def strike_score(arr, idx)
  if idx == 9
    temp_arr = [arr[idx][0]] + [arr[idx][1..-1]]
  else
    temp_arr = [arr[idx]] + [arr[(idx + 1)..-1].join]
  end

  if temp_arr[1][0] == 'X'
    20 + (temp_arr[1][1] == 'X' ? 10 : temp_arr[1][1].to_i)
  elsif temp_arr[1][1] == '/'
    20
  else
    10 + temp_arr[1][0].to_i + temp_arr[1][0].to_i
  end
end

def bowling_score(frames)
  score = 0
  arr = frames.split
  
  (0..9).each do |idx|

    if arr[idx][1] == '/'
      score += spare_score(arr, idx)
    elsif arr[idx][0] == 'X'
      score += strike_score(arr, idx) 
    else
      score += arr[idx][0].to_i + arr[idx][1].to_i
    end
  end
  score

end



p bowling_score('11 11 11 11 11 11 11 11 11 11') #== 20
p bowling_score('X X X X X X X X X XXX') #== 300
p bowling_score('1/ 11 11 11 11 11 11 11 11 1/1')