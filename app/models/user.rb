class User < ApplicationRecord

  def tests_by_level(level)
    Test.where(level: level, user_id: id)
  end
end
