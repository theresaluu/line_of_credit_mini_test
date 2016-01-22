class Transaction < ActiveRecord::Base
  attr_accessor :amount, :day, :withdrawal, :within_credit_line_max

  validates :amount, presence: true
  validates :day, presence: true, numericality: {less_than: 31}
  validates :withdrawal, presence: true
  validate :within_credit_line_max

  belongs_to :credit

  def within_credit_line_max
    return unless self.withdrawal
    line = self.credit
    if self.amount > line.line_max
      self.errors.add(:amount, "exceeds credit line")
    end
  end

end
