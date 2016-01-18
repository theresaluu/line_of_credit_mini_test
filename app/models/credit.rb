class Credit < ActiveRecord::Base
  validates :apr, presence: true, numericality: {less_than: 1.0, greater_than: 0.0}
  validates :line_max, presence: true, numericality: {greater_than:0.0}
end
