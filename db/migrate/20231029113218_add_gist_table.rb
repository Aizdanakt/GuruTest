class AddGistTable < ActiveRecord::Migration[7.0]
  def change
    create_table :gists do |t|
      t.string :body, null: false
      t.string :gist_url, null: false
      t.references :user, foreign_key: true, null: false
      t.references :question, foreign_key: true, null: false

      t.timestamps
    end
  end
end
