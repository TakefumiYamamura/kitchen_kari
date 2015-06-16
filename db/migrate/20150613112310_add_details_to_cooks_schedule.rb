class AddDetailsToCooksSchedule < ActiveRecord::Migration
  def change
    add_column :cooks_schedules, :date, :date
    add_column :cooks_schedules, :start_time, :integer
    add_column :cooks_schedules, :user_id, :integer
    add_column :cooks_schedules, :flag, :integer
  end
end
