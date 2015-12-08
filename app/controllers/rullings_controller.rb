class RullingsController < ApplicationController
  before_action :set_rulling, only: [:show, :edit, :update, :destroy]

  # GET /rullings
  # GET /rullings.json
  def index
    @rullings = Rulling.all
  end

  # GET /rullings/1
  # GET /rullings/1.json
  def show
  end

  # GET /rullings/new
  def new
    @rulling = Rulling.new
  end

  # GET /rullings/1/edit
  def edit
  end

  # POST /rullings
  # POST /rullings.json
  def create
    @rulling = Rulling.new(rulling_params)

    respond_to do |format|
      if @rulling.save
        format.html { redirect_to @rulling, notice: 'Rulling was successfully created.' }
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
        format.html { redirect_to @rulling, notice: 'Rulling was successfully updated.' }
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rulling
      @rulling = Rulling.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rulling_params
      params.require(:rulling).permit(:title, :objective, :description)
    end
end
