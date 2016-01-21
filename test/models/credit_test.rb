require 'test_helper'
class CreditTest < ActiveSupport::TestCase

  [:apr, :line_max].each do |param|
    should validate_presence_of(param)
  end
  should validate_numericality_of(:apr).is_less_than(1.0).is_greater_than(0.0)
  should validate_numericality_of(:line_max).is_greater_than(0.0)
  should have_many(:transactions)

  def setup
    @line = Credit.new({apr: 0.35, line_max: 1000})
    @transactions = @line.transactions
  end

  def test_grand_total
    @transactions << Transaction.new({amount: 200.00, day: 0, withdrawal: true})
    assert_equal(205.75, @line.grand_totals)
  end

end
