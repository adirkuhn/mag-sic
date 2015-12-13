class MootsController < ApplicationController
  before_action :set_moot, only: [:show, :edit, :update, :destroy]
  before_action :find_company, only: [:new, :create]

  # GET /moots
  # GET /moots.json
  def index
    @moots = Moot.all
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
end
