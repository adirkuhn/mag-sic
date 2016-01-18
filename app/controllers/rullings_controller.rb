class RullingsController < ApplicationController
  before_action :authenticate_user!

  layout 'admin-application'

  before_action :set_rulling, only: [:show, :edit, :update, :destroy, :vote, :vote_status]
  before_action :find_moot, only: [:new, :create, :index]

  before_action :for_admins, except: [:index, :show, :vote]
  before_action :for_members, only: [:show, :index, :vote]

  skip_before_filter :verify_authenticity_token, :only => [:vote, :vote_status]

  # GET /rullings
  # GET /rullings.json
  def index
    @rullings = @moot.rullings
  end

  # GET /rullings/1
  # GET /rullings/1.json
  def show
  end

  # GET /rullings/new
  def new
    @rulling = @moot.rullings.build
  end

  # GET /rullings/1/edit
  def edit
  end

  # POST /rullings
  # POST /rullings.json
  def create
    @rulling = @moot.rullings.build(rulling_params)

    respond_to do |format|
      if @rulling.save
        format.html { redirect_to [@rulling.moot.company, @rulling.moot], notice: 'Rulling was successfully created.' }
        format.json { render :show, status: :created, location: @rulling }
      else
        format.html { render :new }
        format.json { render json: @rulling.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rullings/1
  # PATCH/PUT /rullings/1.json
  def update
    respond_to do |format|
      if @rulling.update(rulling_params)
        format.html { redirect_to [@rulling.moot.company, @rulling.moot], notice: 'Rulling was successfully updated.' }
        format.json { render :show, status: :ok, location: @rulling }
      else
        format.html { render :edit }
        format.json { render json: @rulling.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rullings/1
  # DELETE /rullings/1.json
  def destroy
    @rulling.destroy
    respond_to do |format|
      format.html { redirect_to rullings_url, notice: 'Rulling was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def vote
    if params[:vote] && ( params[:vote] == 's' || params[:vote] == 'n')
      if (@rulling.moot.user_can_vote?(current_user))

        rulling_vote = @rulling.rulling_votes.find_by_user_id_and_rulling_id(current_user, @rulling)
        if rulling_vote && rulling_vote.update(:vote => params[:vote])
          return render json: "ok"
        end

        rulling_vote = @rulling.rulling_votes.build
        rulling_vote.user = current_user
        rulling_vote.vote = params[:vote]

        if rulling_vote.save
          return render json: "ok"
        end
      end
    end

    return head 400
  end

  def vote_status

    unless params[:user_id]
      return head 400
    end

    user = @rulling.moot.company.members.find(params[:user_id])

    if user
      rulling_vote = @rulling.rulling_votes.find_by_user_id_and_rulling_id(user, @rulling)
      if rulling_vote
        if rulling_vote.vote == 's'
          return render json: "voto a favor"
        end

        return render json: "voto contra"
      end

      return render json: "sem voto para pauta"
    end

    return render json: "erro", :status => 400
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rulling
      @rulling = Rulling.find(params[:id])
    end

    def find_moot
      @moot = Moot.find(params[:moot_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rulling_params
      params.require(:rulling).permit(:title, :objective, :description)
    end

    def for_admins
      if @rulling
        unless @rulling.moot.company.is_admin(current_user)
          head :forbidden
        end
      else
        unless @moot.company.is_admin(current_user)
          head :forbidden
        end
      end
    end

    def for_members
      if @rulling
        unless @rulling.moot.company.is_member(current_user)
          head :forbidden
        end
      else
        unless @moot.company.is_member(current_user)
          head :forbidden
        end
      end
    end
end
