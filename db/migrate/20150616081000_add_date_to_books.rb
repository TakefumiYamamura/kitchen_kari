class AddDateToBooks < ActiveRecord::Migration
  def change
    add_column :books, :date, :date
    add_column :books, :start_time, :integer
  end
end
