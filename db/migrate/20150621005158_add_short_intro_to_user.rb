class AddShortIntroToUser < ActiveRecord::Migration
  def change
    add_column :users, :short_introduction, :text
  end
end
