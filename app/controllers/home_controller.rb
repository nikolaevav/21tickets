# -*- coding: utf-8 -*-
class HomeController < ApplicationController
  before_filter :setup_negative_captcha, only: [:index, :submit]

  def index
    @set = Setting.find_or_create_by(name: 'ticket')
  end

  def else
    redirect_to root_path
  end

  def submit
    NoticeMailer.new_callback_form(@captcha.values).deliver
    flash[:notice] = 'Спасибо за заказ, мы свяжемся с вами в ближайшее время!'
    redirect_to root_path
  end

  private

  def setup_negative_captcha
    @captcha = NegativeCaptcha.new(

      secret: ENV['SECRET_TOKEN'],
      spinner: request.remote_ip, 

      fields: [:name, :phone, :email],
      params: params
    )
  end
end
