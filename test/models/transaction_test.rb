require 'test_helper'

class TransactionTest < ActiveSupport::TestCase
  should belong_to(:credit)


  [:amount, :day, :type].each do |param|
    should validate_presence_of(param)
  end
end
