class Credit < ActiveRecord::Base
  validates :apr, presence: true, numericality: {less_than: 1.0, greater_than: 0.0}
  validates :line_max, presence: true, numericality: {greater_than:0.0}

  attr_accessor :apr, :line_max, :current_balance, :grand_totals

  has_many :transactions

  def current_balance
    loan_amounts = []
    self.transactions.each do |credit|
      if credit.withdrawal
        loan_amounts << credit.amount
      else
        loan_amounts << -credit.amount.to_f
      end
    end
    loan_amounts.reduce(:+)
  end

  def grand_totals
    segment_totals = []

    self.transactions.each_cons(2) do |line_item, next_line_item|
      duration = next_line_item.day.to_i - line_item.day
      if line_item.day == 0
        loan_amount = line_item.amount
      else
        loan_amount = self.current_balance
      end
      line_item_total = (loan_amount * 0.35/365*(duration)).round(2)
      segment_totals << line_item_total
    end
    segment_totals.reduce(:+).to_f + self.current_balance
  end

end
