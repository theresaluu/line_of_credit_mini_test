class Transaction < ActiveRecord::Base

  belongs_to :credit

  validates :amount, presence: true
  validates :day, presence: true, numericality: {less_than: 31}
  validates :withdrawal, presence: true
  validates :amount, numericality:{less_than: self.credit.line_max}, if: :withdrawal
  #validate :within_credit_line_max

  def within_credit_line_max
    return unless self.withdrawal
    line = self.credit
    if self.amount > line.line_max
      self.errors[:transaction] << "exceeds credit line"
    end
  end

end
