class CooksSchedule < ActiveRecord::Base

  class << self
    def fetch_two_weeks(day)
      dates = []
      14.times do |i|
        dates << Marshal.load(Marshal.dump(day))
        day = day + 1
      end
      dates
    end
  end
end
