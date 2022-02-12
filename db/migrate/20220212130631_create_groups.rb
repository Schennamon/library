class CreateGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|
      t.integer "book_id"
      t.integer "category_id"
      t.timestamps
    end
  end
end
