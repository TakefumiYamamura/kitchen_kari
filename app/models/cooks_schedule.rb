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
