class AddCulumnsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :explanation, :text
    add_column :products, :user_id, :integer
    add_column :products, :title, :string
    add_column :products, :price, :integer
    add_column :products, :capacity, :integer
  end
end
