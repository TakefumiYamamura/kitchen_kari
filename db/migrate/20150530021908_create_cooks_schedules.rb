class CreateCooksSchedules < ActiveRecord::Migration
  def change
    create_table :cooks_schedules do |t|

      t.timestamps
    end
  end
end
