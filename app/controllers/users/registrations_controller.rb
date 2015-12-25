class Users::RegistrationsController < Devise::RegistrationsController
# before_filter :configure_sign_up_params, only: [:create]
# before_filter :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    build_params


    if params[:admin_token]
      session[:admin_token] = params[:admin_token]
    elsif params[:voter_token]
      session[:voter_token] = params[:voter_token]
    end
    #   @plan = Plan.find(session[:plan_id])
    #   render 'buy'
    # else
    #   respond_with self.resource
    # end

    @securityQuestions = SecurityQuestion.all
    respond_with resource
  end

  # POST /resource
  def create
    build_resource(sign_up_params)

    # if session[:plan_id]
    #   plan = Plan.find(session[:plan_id])
    #   resource.plan = plan
    #   resource.is_admin = true
    # end

    resource.save
    yield resource if block_given?
    if resource.persisted?

      if session[:admin_token]
        setAdmin(resource)
      elsif session[:voter_token]
        setVoter(resource)
      end

      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_flashing_format?
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length

      # if session[:plan_id]
      #   @plan = Plan.find(session[:plan_id])
      #   render 'buy'
      # else
      #   respond_with resource
      # end

      respond_with resource
    end
  end


  private

  def build_params
    build_resource({})
    set_minimum_password_length
    yield resource if block_given?
  end

  def setAdmin(user)

    invitedAdmin = AdminInvite.where(:token => session[:admin_token]).first

    if invitedAdmin && invitedAdmin.email == user.email
      companyAdmin = CompanyAdmin.new
      companyAdmin.company = invitedAdmin.company
      companyAdmin.user = user

      companyAdmin.save
    end

    session.delete(:admin_token)
  end

  def setVoter(user)

    invitedVoter = VoterInvite.where(:token => session[:voter_token]).first

    if invitedVoter && invitedVoter.email == user.email
      companyVoter = CompanyVoter.new
      companyVoter.company = invitedVoter.company
      companyVoter.user = user

      companyVoter.save
    end

    session.delete(:voter_token)
  end

  # # POST /resource
  # def create
  #   super
  # end

  # # GET /resource/edit
  # def edit
  #   render 'edit'
  # end

  # # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.for(:sign_up) << :attribute
  # end
  # def sign_up_params
  #   params.require(:user).permit(:name, :email, :password, :password_confirmation)
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.for(:account_update) << :attribute
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
