require 'minitest/autorun'
require_relative 'transaction'

class TransactionTest < Minitest::Test
  def test_prompt_for_payment
    transaction = Transaction.new(50)
    input_amount = StringIO.new("60\n")
    transaction.prompt_for_payment(input: input_amount)
    assert_equal 60, transaction.amount_paid
  end
end


# def prompt_for_payment(input: $stdin)
#   loop do
#     puts "You owe $#{item_cost}.\nHow much are you paying?"
#     @amount_paid = input.gets.chomp.to_f
#     break if valid_payment? && sufficient_payment?
#     puts 'That is not the correct amount. ' \
#          'Please make sure to pay the full cost.'
#   end