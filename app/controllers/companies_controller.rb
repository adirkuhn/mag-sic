class CompaniesController < ApplicationController
  before_action :authenticate_user!

  before_action :set_company, only: [:show, :edit, :update, :destroy, :plans, :chooseplan,
    :admins, :admins_save, :voters, :voters_save]

  before_action :for_admins, except: [:index, :show]
  before_action :for_members, only: [:show]

  layout 'admin-application'

  # GET /companies
  # GET /companies.json
  def index
    @companies = current_user.companies
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
    @plans = Plan.all
  end

  # GET /companies/new
  def new
    @company = current_user.companies.build
  end

  # GET /companies/1/edit
  def edit
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = current_user.companies.create(company_params)
    @company.set_admin

    respond_to do |format|
      if @company.save
        format.html { redirect_to @company, notice: 'Company was successfully created.' }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to @company, notice: 'Company was successfully updated.' }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'Company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  #plan
  def plans
    @plans = Plan.all
  end

  def chooseplan
    if @company.plan == nil
      plan = Plan.find(params[:id_plan])
      @company.plan = plan
      @company.save

      redirect_to @company
    end
  end

  #admins
  def admins
    @adminInvite = AdminInvite.new
  end

  def admins_save

    email = params[:admin_invite][:email]

    user = User.where("email = ? OR cpf = ?", email, email).first

    if user.blank?
      adminInvite = AdminInvite.new

      #token
      adminInvite.token = Digest::SHA1.hexdigest([Time.now, rand].join)

      adminInvite.email = email

      #extra data
      adminInvite.company = @company #company to admin
      adminInvite.user = current_user #invited by

      if adminInvite.save
        AdminInviteMailer.convite(adminInvite).deliver_now
        redirect_to @company
      end

    else

      companyAdmin = CompanyAdmin.new
      companyAdmin.user = user
      companyAdmin.company = @company

      if companyAdmin.save
        redirect_to @company
      end
    end

  end

  def voters
    @voterInvite = VoterInvite.new
  end

  def voters_save

    email = params[:voter_invite][:email]

    user = User.where("email = ? OR cpf = ?", email, email).first

    if user.blank?
      voterInvite = VoterInvite.new

      #token
      voterInvite.token = Digest::SHA1.hexdigest([Time.now, rand].join)

      voterInvite.email = email

      #extra data
      voterInvite.company = @company #company to admin
      voterInvite.user = current_user #invited by

      if voterInvite.save
        VoterInviteMailer.convite(voterInvite).deliver_now
        redirect_to @company
      end

    else

      companyVoter = CompanyVoter.new
      companyVoter.user = user
      companyVoter.company = @company

      if companyVoter.save
        redirect_to @company
      end
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(:name, :site, :cnpj, :email, :cpf)
    end

    def for_admins
      unless @company.is_admin(current_user)
        head :forbidden
      end
    end

    def for_members
      unless @company.is_member(current_user)
        head :forbidden
      end
    end
end
