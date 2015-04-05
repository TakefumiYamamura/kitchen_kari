class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :area, :string
    add_column :users, :address, :text
    add_column :users, :tel, :integer
  end
end
