class AttachmentsController < ApplicationController
  def create

    if (params[:attachment][:moot])
      moot = Moot.find(params[:attachment][:moot])
      if params[:path] && params[:path].any?
        params[:path].each do |att|
          moot.attachments.create(path: att)
        end
      end

      redirect_to [moot.company, moot]

    elsif (params[:attachment][:rulling])
      rulling = Rulling.find(params[:attachment][:rulling])
      if params[:path] && params[:path].any?
        params[:path].each do |att|
          rulling.attachments.create(path: att)
        end
      end

      redirect_to [rulling.moot.company, rulling.moot, rulling]
    end
  end
end
