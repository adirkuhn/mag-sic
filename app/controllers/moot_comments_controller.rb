class MootCommentsController < ApplicationController
  before_action :authenticate_user!

  before_action :set_moot, only: [:index, :show, :edit, :update, :destroy, :create]

  before_action :for_members, only: [:show]

  def show
    @comments = @moot.moot_comments
    return render json: @comments
  end

  def new
  end

  def create
    if params[:moot_id]

        # moot = Moot.find(params[:moot_id])
        comment = @moot.moot_comments.create(moot_comment_params)
        comment.user = current_user
        if comment.save
            redirect_to [@moot.company, @moot], notice: 'Comentário adicionado.'
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

    def set_moot
      @moot = Moot.find(params[:moot_id])
    end

    def moot_comment_params
      params.require(:moot_comment).permit(:comment)
    end

    def for_members
      unless @moot.company.is_member(current_user)
        head :forbidden
      end
    end
end
