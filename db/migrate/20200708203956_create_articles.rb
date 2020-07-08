class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :name
      t.boolean :star
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
