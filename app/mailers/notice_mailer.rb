class NoticeMailer < ActionMailer::Base
  default from: "flarieat.confirm@gmail.com"
  add_template_helper(ApplicationHelper)
  def dinners_confirm(dinners, cooks, reservation)
    @cooks = cooks
    @dinners = dinners
    @reservation = reservation
    mail to: dinners.email, subject: "【ふらり〜と】予約完了のお知らせ"
  end
  def cooks_confirm(cooks, dinners, reservation)
    @cooks = cooks
    @dinners = dinners
    @reservation = reservation
    mail to: cooks.email, subject: "【ふらり〜と】あなとの料理を食べたい人から予約がきました。"
  end
end
