class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :permalink
      t.string :topic
      t.string :title
      t.string :keywords
      t.string :description
      t.text :content

      t.timestamps
    end
    add_index :articles, :permalink
  end
end
