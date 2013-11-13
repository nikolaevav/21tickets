class HomeController < ApplicationController
  before_filter :setup_negative_captcha, only: [:index, :submit]

  def index
  end

  def else
    redirect_to root_path
  end

  def submit
    @callback_form = CallbackForm.new(@captcha.values)
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
