require 'test_helper'

class CreditTest < ActiveSupport::TestCase
  [:apr, :line_max].each do |param|
    should validate_presence_of(param)
  end
  should validate_numericality_of(:apr).is_less_than(1.0).is_greater_than(0.0)
  should validate_numericality_of(:line_max).is_greater_than(0.0)
end
