class Credit < ActiveRecord::Base
  validates :apr, presence: true
  validates :line_max, presence: true
end
