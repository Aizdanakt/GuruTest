class CreateRules < ActiveRecord::Migration[7.0]
  def change
    create_table :rules do |t|
      t.string :criteria, null: false

      t.timestamps
    end
  end
end
