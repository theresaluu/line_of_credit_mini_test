class Credit < ActiveRecord::Base
  validates :apr, presence: true
end
