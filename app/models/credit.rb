class Credit < ActiveRecord::Base
  validates :apr, presence: true, numericality: {less_than: 1.0, greater_than: 0.0}
  validates :line_max, presence: true, numericality: {greater_than:0.0}
  validates :name, presence: true

  attr_accessor :apr, :line_max, :interest_total, :current_balance, :grand_totals

  has_many :transactions

  def interest_total
    interests = []
    self.transactions.each_cons(2) do |line_item, next_line_item|
      duration = next_line_item.day.to_i - line_item.day
      interests << segment_total(segment_balance(line_item), self.apr, duration)
    end
    interests << last_transaction(self.transactions.last, self.current_balance)
    interests.reduce(:+).to_f
  end

  def current_balance
    loan_amounts = []
    self.transactions.each do |credit|
      deposit_or_withdraw_amount(credit, loan_amounts)
    end
    loan_amounts.reduce(:+)
  end

  def grand_totals
    self.interest_total + self.current_balance
  end

  private
  def segment_total(amount, apr, duration)
    (amount * apr / 365 * (duration)).round(2)
  end

  def deposit_or_withdraw_amount(transaction, array)
    if transaction.withdrawal
      array << transaction.amount
    else
      array << -transaction.amount.to_f
    end
  end

  def last_transaction(last_transaction, balance)
    duration = 30 - last_transaction.day
    segment_total(segment_balance(last_transaction), self.apr, duration)
  end

  def segment_balance(segment)
    if segment.day == 0
      loan_amount = segment.amount
    else
      loan_amount = self.current_balance
    end
  end
end
