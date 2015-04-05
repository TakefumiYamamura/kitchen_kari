class RenameUserIdColumnToBooks < ActiveRecord::Migration
  def up
    rename_column :books, :user_id, :books_user_id
  end
  def down
    rename_column :books, :books_user_id, :user_id
  end
end
