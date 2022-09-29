def minilang(command)
  register = 0
  stack = []
  command_arr = command.split

  command_arr.map! do |str|
    if str.to_i.to_s == str
      str.to_i
    else
      str
    end
  end

  command_arr.each do |cmd|
    register = cmd if cmd.class == Integer

    case cmd 
    when 'PUSH'   then stack << register
    when 'ADD'    then register += stack.pop
    when 'SUB'    then register -= stack.pop
    when 'MULT'   then register *= stack.pop
    when 'DIV'    then register /= stack.pop
    when 'MOD'
      div, rem = register.divmod(stack.pop)
      register = rem
    when 'POP'    then register = stack.pop
    when 'PRINT'  then puts register
    end
  end

end

minilang('PRINT')
# 0

minilang('5 PUSH 3 MULT PRINT')
# 15

minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8

minilang('5 PUSH POP PRINT')
# 5

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7

minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6

minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12

minilang('-3 PUSH 5 SUB PRINT')
# 8

minilang('6 PUSH')
# (nothing printed; no PRINT commands)

minilang('3 PUSH 5 MOD PUSH 3 PUSH 4 PUSH 5 MULT ADD PUSH -7 ADD DIV PRINT')

