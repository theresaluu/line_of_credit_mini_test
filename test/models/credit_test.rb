require 'test_helper'

class CreditTest < ActiveSupport::TestCase
  should validate_presence_of(:apr)
  should validate_numericality_of(:apr).is_less_than(1.0).is_greater_than(0.0)
  should validate_presence_of(:line_max)
  should validate_numericality_of(:line_max).is_greater_than(0.0)
end
