class User < ApplicationRecord
  EMAIL_FORMAT = /\A[^\s@]+@[^\s@]+\.[^\s@]+\z/
  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy
  has_many :user_passed_tests, dependent: :destroy
  has_many :tests, through: :user_passed_tests

  validates :name, uniqueness: { scope: :email }
  validates :email, format: { with: EMAIL_FORMAT }

  has_secure_password

  def user_tests_by_level(level)
    tests.where(level: level)
  end

  def user_passed_test(test)
    user_passed_tests.order(id: :desc).find_by(test_id: test.id)
  end
end
