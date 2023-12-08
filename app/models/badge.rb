class Badge < ApplicationRecord
  belongs_to :rule

  has_many :achievements, dependent: :destroy
  has_many :users, through: :achievements

  validates :option_data, presence: true
end
