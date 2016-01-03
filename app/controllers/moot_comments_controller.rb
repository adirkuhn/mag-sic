class MootCommentsController < ApplicationController

  def new
  end

  def create
    if params[:moot_id]

        moot = Moot.find(params[:moot_id])
        comment = moot.moot_comments.create(moot_comment_params)
        comment.user = current_user
        if comment.save
            redirect_to [moot.company, moot], notice: 'Comentário adicionado.'
        end
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    def moot_comment_params
      params.require(:moot_comment).permit(:comment)
    end
end
