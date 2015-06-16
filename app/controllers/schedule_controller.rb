class ScheduleController < ApplicationController
  def new
    @days = CooksSchedule.fetch_two_weeks(Date.today)
  end

  def create
    params[:shift].each do |date,value1|
      value1.each do |key,value2|
        # key = key.split("-")
        schedule =  CooksSchedule.where(date: date, user_id: current_user.id, start_time: key.to_i).first_or_initialize
        if schedule.flag.blank?
          schedule.flag = 0
        elsif schedule.available?
          schedule.flag = 1
        else
          schedule.flag = 0
        end
        schedule.save
        # CooksSchedule.create(date: date, user_id: current_user.id, start_time: key.to_i, flag: 0)
      end
    end
    redirect_to new_schedule_path
  end
end
