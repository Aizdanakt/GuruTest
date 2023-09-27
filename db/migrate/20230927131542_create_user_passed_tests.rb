class CreateUserPassedTests < ActiveRecord::Migration[7.0]
  def change
    create_table :user_passed_tests do |t|
      t.references :user, foreign_key: true, null: false
      t.references :test, foreign_key: true, null: false
      t.string :test_status, null: false

      t.timestamps
    end
  end
end
