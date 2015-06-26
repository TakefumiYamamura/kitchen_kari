class CooksSchedule < ActiveRecord::Base
  belongs_to :user
  enum flag: %i(available impossible always)
  class << self
    def fetch_two_weeks(day)
      dates = []
      14.times do |i|
        dates << Marshal.load(Marshal.dump(day))
        day = day + 1
      end
      dates
    end

    def create_cooks_schedule(shift, user)
      shift.each do |date,value1|
        value1.each do |key,value2|
        # key = key.split("-")
        schedule =  CooksSchedule.where(date: date, user_id: user.id, start_time: key.to_i).first_or_initialize
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
    end

    # def fetch_two_weeks(user)
    #   dates= []
    #   day = Date.today
    #   14.times do |i|
    #     dates << Marshal.load(Marshal.dump(day))
    #     day = day + 1
    #   end
    #   user.schedules.available.where(date: dates)
    # end
  end
end
