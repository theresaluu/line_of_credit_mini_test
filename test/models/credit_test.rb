require 'test_helper'

class CreditTest < ActiveSupport::TestCase
  should validate_presence_of(:apr)
  should validate_presence_of(:line_max)
end
