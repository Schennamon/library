class CreateAdmins < ActiveRecord::Migration[6.1]
  def change
    create_table :admins do |t|
      t.string "name"
      t.string "password_digest"
      t.boolean "root", default: false
      t.boolean "rights_to_books", default: false
      t.boolean "rights_to_categories", default: false
      t.timestamps
    end
  end
end
