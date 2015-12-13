class AttachmentsController < ApplicationController
  def create

    puts params[:path].count

    moot = Moot.find(params[:attachment][:moot])
    if params[:path].any?
      params[:path].each do |att|
        moot.attachments.create(path: att)
      end
    end

    redirect_to [moot.company, moot]
  end
end
