class AddTimeToProducts < ActiveRecord::Migration
  def change
    add_column :products, :start_time, :time
    add_column :products, :finish_time, :time
  end
end
