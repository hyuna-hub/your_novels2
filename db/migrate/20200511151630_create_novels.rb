class CreateNovels < ActiveRecord::Migration[5.2]
  def change
    create_table :novels do |t|
      t.integer :user_id
      t.string :title
      t.text :body
      t.text :caption
      t.integer :genre, default: 0

      t.timestamps
    end
  end
end
