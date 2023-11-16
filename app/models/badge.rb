class Badge < ApplicationRecord
  belongs_to :rule
  belongs_to :category, optional: true
  belongs_to :test, optional: true
  belongs_to :test_level, class_name: 'Test', optional: true

  has_many :achievements, dependent: :destroy
  has_many :users, through: :achievements
end
