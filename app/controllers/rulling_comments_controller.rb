class RullingCommentsController < ApplicationController
  def new
  end

  def create
    if params[:rulling_id]
        rulling = Rulling.find(params[:rulling_id])
        comment = rulling.rulling_comments.create(rulling_comment_params)
        comment.user = current_user
        if comment.save
            redirect_to [rulling.moot.company, rulling.moot, rulling], notice: 'Comentário adicionado.'
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

    def rulling_comment_params
      params.require(:rulling_comment).permit(:comment)
    end
end