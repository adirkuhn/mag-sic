class HomeController < ApplicationController
  layout '../home/layout'

  def index
    if user_signed_in?
      redirect_to admin_index_path
    end

    @plans = Plan.all
  end

  def buy
    session[:plan_id] = params[:id]

    redirect_to new_user_registration_path
  end
end
