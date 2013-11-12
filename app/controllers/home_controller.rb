class HomeController < ApplicationController
  def index
  end

  def else
    redirect_to root_path
  end
end
