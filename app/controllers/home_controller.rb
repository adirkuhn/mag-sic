class HomeController < ApplicationController
  layout '../home/layout'

  def index
    if user_signed_in?
      redirect_to admin_index_path
    end

    @plans = Plan.all
  end

  def buy
    @plan = Plan.find(params[:id])

    render 'devise/registrations/buy'
  end
end
