class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.integer :user_id
      t.integer :product_id
      t.string :book_time
      t.integer :persons

      t.timestamps
    end
  end
end
