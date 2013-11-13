class SettingsController < ApplicationController
  before_filter :authenticate_user!

  def edit
    @set = Setting.find(params[:id])
    @setting = @set
  end

  def update
    @setting = Setting.find(params[:id])
    @setting.update_attributes(setting_params)
    redirect_to root_path
  end

  private

  def setting_params
    params.require(:setting).permit(:title, :description, :keywords,
                                    :email, :email_show, :phone_one,
                                    :phone_two, :metrika, :google,
                                    :vkgroup, :fbgroup)
  end
end