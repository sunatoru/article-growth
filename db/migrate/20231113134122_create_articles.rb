class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|

      t.string :title, null: false
      t.text :content, null: false
      t.integer :status, default: 0, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
