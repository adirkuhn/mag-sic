class AdminController < ApplicationController

  before_action :authenticate_user!

  layout 'admin-application'

  #check if user is current signed in
  #before_action :check_is_admin

  def index
    @moots = Moot.all
  end

  private
  def check_is_admin
    unless user_signed_in? && current_user.is_admin?
      redirect_to new_user_session_path
    end
  end
end
