def staggered_case(str)
  case_up = true
  result = ''
  str.chars.each do |char|
    if char =~ /[^a-zA-Z]/
      result << char
      next
    elsif case_up
      result << char.upcase
    else
      result << char.downcase
    end
    case_up = !case_up
  end
  result
end



p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'