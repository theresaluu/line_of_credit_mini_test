require 'test_helper'

class TransactionTest < ActiveSupport::TestCase
  should belong_to(:credit)

  [:amount, :day, :withdrawal].each do |param|
    should validate_presence_of(param)
  end

  def setup
    @line = Credit.new({apr: 0.35, line_max: 1000})
    @transactions = @line.transactions
  end

  def test_size_of_transactions
    @transactions << Transaction.new({amount: 200.00, day: 0, withdrawal: true})
    @transactions << Transaction.new({amount: 100.00, day: 16, withdrawal: false})
    assert_equal(2, @transactions.size)
  end

end
