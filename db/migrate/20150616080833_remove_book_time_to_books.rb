class RemoveBookTimeToBooks < ActiveRecord::Migration
  def change
    remove_column :books, :book_time, :string
  end
end
