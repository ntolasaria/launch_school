def staggered_case(str)
  str_arr = str.chars.map.with_index do |char, idx|
    if idx.even?
      char.upcase
    else
      char.downcase
    end
  end
  str_arr.join
end

def staggered_case2(str)
  make_upcase = true
  new_str = ''
  str.chars.each do |char|
    if char =~ /[a-zA-Z]/
      if make_upcase
        new_str << char.upcase
      else
        new_str << char.downcase
      end
      make_upcase = !make_upcase 
    else
      new_str << char
    end
  end
  new_str
end





p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

p staggered_case2('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case2('ALL CAPS') == 'AlL cApS'
p staggered_case2('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'