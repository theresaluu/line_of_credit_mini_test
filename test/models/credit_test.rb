require 'test_helper'

class CreditTest < ActiveSupport::TestCase

  [:apr, :line_max, :name].each do |param|
    should validate_presence_of(param)
  end
  should validate_numericality_of(:apr).is_less_than(1.0).is_greater_than(0.0)
  should validate_numericality_of(:line_max).is_greater_than(0.0)
  should have_many(:transactions)

  def setup
    @line = Credit.new({apr: 0.35, line_max: 1000, name: 'Tommy'})
    @transactions = @line.transactions
  end

  def test_interest_total
    @transactions << Transaction.new({amount: 100.00, day: 0, withdrawal: true})
    @transactions << Transaction.new({amount: 50.00, day: 15, withdrawal: false})

    assert_equal(2.16, @line.interest_total)
  end

  def test_current_balance
    @transactions << Transaction.new({amount: 100.00, day: 0, withdrawal: true})
    @transactions << Transaction.new({amount: 50.00, day: 15, withdrawal: false})
    @transactions << Transaction.new({amount: 100.00, day: 20, withdrawal: true})
    @transactions << Transaction.new({amount: 50.00, day: 25, withdrawal: false})

    assert_equal(100, @line.current_balance)
  end

  def test_grand_total
    @transactions << Transaction.new({amount: 100.00, day: 0, withdrawal: true})
    @transactions << Transaction.new({amount: 50.00, day: 15, withdrawal: false})
    @transactions << Transaction.new({amount: 100.00, day: 20, withdrawal: true})
    @transactions << Transaction.new({amount: 50.00, day: 25, withdrawal: false})

    #normally I would like to only have an assert per test but I stuck this 
    #in to see why my grand total was not coming to 102.88. The condition I 
    #stuck in after the fact to display amount of $0.00 for for lines with out
    #transactions altered my previously good test. 
    assert_equal(4, @transactions.count)
    assert_equal(102.88, @line.grand_totals)
  end
end
