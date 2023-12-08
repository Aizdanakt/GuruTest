class CreateBadges < ActiveRecord::Migration[7.0]
  def change
    create_table :badges do |t|
      t.string :title, null: false
      t.string :image_url, null: false
      t.string :option_data, null: false
      t.references :rule, null: false, foreign_key: true

      t.timestamps
    end
  end
end
