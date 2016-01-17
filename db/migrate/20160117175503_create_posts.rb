class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :doc_id
      t.date :doc_date

      t.timestamps null: false
    end
  end
end
