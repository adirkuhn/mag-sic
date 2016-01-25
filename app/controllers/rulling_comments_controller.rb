class RullingCommentsController < ApplicationController
  before_action :authenticate_user!

  before_action :set_rulling, only: [:index, :show, :edit, :update, :destroy, :create]

  before_action :for_members, only: [:show, :index]

  def index
    @comments = @rulling.rulling_comments
    return render json: @comments
  end

  def show
  end

  def new
  end

  def create
    if params[:rulling_id]
        # rulling = Rulling.find(params[:rulling_id])
        comment = @rulling.rulling_comments.create(rulling_comment_params)
        comment.user = current_user
        if comment.save
            redirect_to [@rulling.moot.company, @rulling.moot, @rulling], notice: 'Comentário adicionado.'
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

    def set_rulling
      @rulling = Rulling.find(params[:rulling_id])
    end

    def rulling_comment_params
      params.require(:rulling_comment).permit(:comment)
    end

    def for_members
      unless @rulling.moot.company.is_member(current_user)
        head :forbidden
      end
    end
end