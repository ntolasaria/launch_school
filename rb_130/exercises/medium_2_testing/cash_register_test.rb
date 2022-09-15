require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  attr_reader :register

  def setup
  end

  def test_accept_money
    register = CashRegister.new(1000)
    transaction = Transaction.new(50)
    transaction.amount_paid = 50

    previous_amount = register.total_money
    register.accept_money(transaction)
    new_amount = register.total_money

    assert_equal previous_amount + 50, new_amount
  end

  def test_change
    register = CashRegister.new(1000)
    transaction = Transaction.new(50)
    transaction.amount_paid = 90

    assert_equal 40, register.change(transaction)
  end

  def test_give_receipt
    register = CashRegister.new(1000)
    item_cost = 50
    transaction = Transaction.new(item_cost)

    expected_output = "You've paid $#{item_cost}.\n"
    assert_output(expected_output) do 
      register.give_receipt(transaction)
    end
  end
end