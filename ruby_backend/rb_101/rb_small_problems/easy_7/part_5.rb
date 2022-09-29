def staggered_case(str)
  case_up = false
  result = str.chars.map do |char| 
    case_up = !case_up
    if case_up
      char.upcase
    else
      char.downcase
    end
  end
  result.join
end


p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'