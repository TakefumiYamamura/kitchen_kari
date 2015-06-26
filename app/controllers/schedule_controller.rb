class ScheduleController < ApplicationController
  def new
    @days = CooksSchedule.fetch_two_weeks(Date.today)
  end

  def create
    CooksSchedule.create_cooks_schedule(params[:shift], current_user)
    redirect_to new_schedule_path
  end
end
