class Transaction < ActiveRecord::Base
  belongs_to :credit

  validates :credit, presence: true
  validates :amount, presence: true
  validates :day, presence: true, numericality: {less_than: 31}
#  validate :within_credit_line_max, if: Proc.new{|a| a.withdrawal}

#  def within_credit_line_max
#    line = self.credit
#    if self.amount > line.line_max
#      self.errors[:transaction] << "exceeds credit line"
#    end
#  end
end
