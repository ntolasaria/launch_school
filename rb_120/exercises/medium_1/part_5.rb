require 'set'

class MinilangError < StandardError; end
class BadTokenError < MinilangError; end
class EmptyStackError < MinilangError; end


class Minilang
  ACTIONS = Set.new(%w(print push add sub div mult mod pop))

  def initialize(command)
    @register = 0
    @stack = []
    @command = command.downcase
  end

  def eval
    @tokens = @command.split(' ')
    @tokens.each { |token| eval_token(token) }
  rescue MinilangError => error
    puts error.message
  end

  private

  def eval_token(token)
    if token.to_i.to_s == token
      @register = token.to_i
    elsif ACTIONS.include?(token)
      send(token)
    else
      raise BadTokenError, "Invalid token: #{token.upcase}"
    end
  end

  def print
    puts @register
  end

  def push
    @stack << @register
  end

  def add
    @register += pop
  end

  def sub
    @register -= pop
  end

  def div
    @register /= pop
  end

  def mult
    @register *= pop
  end

  def mod
    @register %= pop
  end

  def pop
    raise EmptyStackError, "Empty stack!" if @stack.empty?
    @register = @stack.pop
  end
end


Minilang.new('PRINT').eval
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# # 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# # 5
# # 3
# # 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# # 10
# # 5

Minilang.new('5 PUSH POP POP PRINT').eval
# # Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# # 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# # 12

Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# # 8

Minilang.new('6 PUSH').eval
# # (nothing printed; no PRINT commands)

# CENTIGRADE_TO_FAHRENHEIT =
#   '5 PUSH %<degrees_c>d PUSH 9 MULT DIV PUSH 32 ADD PRINT'
# minilang = Minilang.new(CENTIGRADE_TO_FAHRENHEIT)
# minilang.eval(degrees_c: 100)
# # 212
# minilang.eval(degrees_c: 0)
# # 32
# minilang.eval(degrees_c: -40)
# # -40