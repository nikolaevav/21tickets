# -*- coding: utf-8 -*-
class RegistrationsController < Devise::RegistrationsController
  before_filter :authenticate_user!

  def new
    render text: 'forbidden'
  end

  def edit
    render action: :edit
  end

  def update
    @user = User.find(current_user.id)

    successfully_updated = if needs_password?(@user, params)
      @user.update_with_password(users_params)
    else
      # remove the virtual current_password attribute update_without_password
      # doesn't know how to ignore it
      params[:user].delete(:current_password)
      @user.update_without_password(users_params)
    end

    if successfully_updated
      set_flash_message :notice, :updated
      # Sign in the user bypassing validation in case his password changed
      sign_in @user, bypass: true
      redirect_to edit_user_registration_path
    else
      render action: :edit
    end
  end

  private

  # check if we need password to update user data
  # ie if password or email was changed
  # extend this as needed
  def needs_password?(user, params)
    # user.email != params[:user][:email] ||
    !params[:user][:password].blank?
  end


  def users_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :remember_me,
                                 :avatar, :full_name, :info_image,
                                 :my_vision, :about_me, :technique,
                                 :phone, :email_contact, :site,
                                 :vkontakte, :blog_image)
  end
end
