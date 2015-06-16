module BooksHelper
  def express_time(time)
    if time % 10 == 5
      return "#{time/10}時30分~#{time/10+1}時30分"
    else
      return "#{time/10}時00分~#{time/10+1}時00分"
    end
  end
end
