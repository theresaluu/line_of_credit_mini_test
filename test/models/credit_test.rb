require 'test_helper'

class CreditTest < ActiveSupport::TestCase
  
  def setup
    @credit = Credit.new
  end

  def test_apr_is_required
    @credit.valid?
    assert_includes(@credit.errors[:apr], "can't be blank")
  end
end
