class AdminController < ApplicationController
  def index
    @moots = Moot.all
  end
end
