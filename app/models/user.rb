class User < ApplicationRecord

  def get_user_tests_by_level(level)
    Test.joins('join users on users.id = tests.user_id').where(level: level, user_id: id)
  end
end
