class MootsController < ApplicationController
  before_action :authenticate_user!

  layout 'admin-application'

  before_action :set_moot, only: [
    :show, :edit, :update, :destroy, :invited_users, :add_invited_users, :delete_invited_users
  ]
  before_action :find_company, only: [:index, :new, :create]

  before_action :for_admins, except: [:index, :show]
  before_action :for_members, only: [:index, :show]

  skip_before_filter :verify_authenticity_token, :only => [
    :add_invited_users, :delete_invited_users
  ]

  # GET /moots
  # GET /moots.json
  def index
    @moots = @company.moots
  end

  # GET /moots/1
  # GET /moots/1.json
  def show
  end

  # GET /moots/new
  def new
    @moot = @company.moots.build
  end

  # GET /moots/1/edit
  def edit
  end

  # POST /moots
  # POST /moots.json
  def create
    @moot = @company.moots.build(moot_params)

    respond_to do |format|
      if @moot.save
        format.html { redirect_to [@moot.company, @moot], notice: 'Moot was successfully created.' }
        format.json { render :show, status: :created, location: @moot }
      else
        format.html { render :new }
        format.json { render json: @moot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /moots/1
  # PATCH/PUT /moots/1.json
  def update
    respond_to do |format|
      if @moot.update(moot_params)
        format.html { redirect_to [@moot.company, @moot], notice: 'Moot was successfully updated.' }
        format.json { render :show, status: :ok, location: @moot }
      else
        format.html { render :edit }
        format.json { render json: @moot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /moots/1
  # DELETE /moots/1.json
  def destroy
    company = @moot.company
    @moot.destroy
    respond_to do |format|
      format.html { redirect_to [company], notice: 'Moot was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  #invited users to this moot
  def invited_users
    render json: @moot.list_users_can_vote
  end

  def add_invited_users
    user = @moot.company.members.find(params[:user_id])
    if user && @moot.add_user_can_vote(user)
      return render json: "ok"
    end

    return render json: "fail", status: 404
  end

  def delete_invited_users
    user = @moot.company.members.find(params[:user_id])
    if user && @moot.delete_user_can_vote(user)
      return render json: "ok"
    end

    return render json: "fail", status: 404
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_moot
      @moot = Moot.find(params[:id])
    end

    def find_company
      @company = Company.find(params[:company_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def moot_params
      params.require(:moot).permit(:title, :description, :voting_start_at, :voting_ending_at)
    end

    def for_admins
      if @moot
        unless @moot.company.is_admin(current_user)
          head :forbidden
        end
      else
        unless @company.is_admin(current_user)
          head :forbidden
        end
      end
    end

    def for_members
      if @moot
        unless @moot.company.is_member(current_user)
          head :forbidden
        end
      else
        unless @company.is_member(current_user)
          head :forbidden
        end
      end
    end
end
