class AdminController < ApplicationController

  before_action :authenticate_user!

  layout 'admin-application'

  def index
    @moots = Moot.all
  end
end
