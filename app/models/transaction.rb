class Transaction < ActiveRecord::Base
  validates :amount, presence: true
  validates :day, presence: true
  validates :type, presence: true

  attr_accessor :amount, :day, :type
  belongs_to :credit
end
