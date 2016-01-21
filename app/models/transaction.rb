class Transaction < ActiveRecord::Base
  attr_accessor :amount, :day, :withdrawal

  validates :amount, presence: true
  validates :day, presence: true
  validates :withdrawal, presence: true

  belongs_to :credit

  scope :withdraws, ->{ where(withdrawal: true)}
  scope :deposits, ->{where(withdrawal: false)}

end
