class AddStartTimeToUserPassedTests < ActiveRecord::Migration[7.0]
  def change
    add_column :user_passed_tests, :start_time, :datetime
  end
end
