require 'test_helper'

class TransactionTest < ActiveSupport::TestCase
  should belong_to(:credit)

  [:amount, :day].each do |param|
    should validate_presence_of(param)
  end

  should validate_numericality_of(:day).is_less_than(31)

  def setup
    @line = Credit.new({apr: 0.35, line_max: 1000})
    @transactions = @line.transactions
  end

  def test_size_of_transactions
    @transactions << Transaction.new({amount: 200.00, day: 0, withdrawal: true})
    @transactions << Transaction.new({amount: 100.00, day: 16, withdrawal: false})
    assert_equal(2, @transactions.size)
  end

  def test_exceeds_line_max
    skip("TODO: implement working code to pass this credit limit check")
    @transactions << Transaction.new({amount: 1200.00, day: 0, withdrawal: true})
    @denied_attempt = @transactions.first
    @denied_attempt.valid? 
    assert_equal(@denied_attempt.errors.keys, [:transaction])
  end

  def test_within_line_max
    @transactions << Transaction.new({amount: 1200.00, day: 0, withdrawal: false})
    @not_over_limit = @transactions.first
    @not_over_limit.valid? 
    refute_includes(@not_over_limit.errors.keys, [:transaction])
  end

end
