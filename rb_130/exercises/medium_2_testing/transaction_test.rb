require 'minitest/autorun'
require_relative 'transaction'

class TransactionTest < Minitest::Test
  def test_prompt_for_payment
    transaction = Transaction.new(50)
    input_amount = StringIO.new("60\n")
    output = StringIO.new
    desired_output = "You owe $#{transaction.item_cost}.\nHow much are you paying?\n"
    transaction.prompt_for_payment(input: input_amount, output: output)
    assert_equal 60, transaction.amount_paid
    assert_equal desired_output, output.string
  end
end




# def prompt_for_payment(input: $stdin, output: $stdout)
#   loop do
#     output.puts "You owe $#{item_cost}.\nHow much are you paying?"
#     @amount_paid = input.gets.chomp.to_f
#     break if valid_payment? && sufficient_payment?
#     puts 'That is not the correct amount. ' \
#          'Please make sure to pay the full cost.'
#   end