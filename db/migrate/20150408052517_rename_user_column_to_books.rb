class RenameUserColumnToBooks < ActiveRecord::Migration
  def change
    rename_column :books, :books_user_id, :user_id
  end
end
