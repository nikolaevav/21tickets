# -*- coding: utf-8 -*-
class NoticeMailer < ActionMailer::Base
  default from: 'noreply@21ticket.ru'

  def new_callback_form(params)
    @settings = Setting.find(1)
    if @settings.email.present?
      @email = @settings.email
    else
      @email = "1_rkm@mail.ru"
    end
    @client = params
    mail to: @email, subject: "Уведомление о новом заказе"
  end

end
