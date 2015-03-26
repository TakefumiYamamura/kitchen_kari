class AddCulumnsToImages < ActiveRecord::Migration
  def change
    add_column :images, :user_id, :integer
    add_column :images, :product_id, :integer
  end
end
