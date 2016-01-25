ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  def create_user(params = {})
    email = params[:email] ||  "joao@assembleias.com.br"
    password = params[:password] ||  "super123"
    name = params[:name] ||  "Joao Da Silva"
    cpf = params[:cpf] ||  "11111111111"
    securityQuestion1_id = params[:securityQuestion1_id] ||  1
    securityAnswer1 = params[:securityAnswer1] || "segredos"

    post_via_redirect "/users.json", { user:
      {
        email: email,
        password: password,
        name: name,
        cpf: cpf,
        securityQuestion1_id: securityQuestion1_id,
        securityAnswer1: securityAnswer1
      }
    }

    assert_response :created
  end

  def logoff_user
    delete "/users/sign_out.json"
    assert_response :no_content
  end

  def create_company(company = {})
    name = company[:name] || 'Compania de teste'
    site = company[:site] || 'www.companiadeteste.com.br'
    cnpj = company[:cnpj] || '01001001000101'

    # http://localhost:3000/companies.json
    post "/companies.json", {
      company: {
        name: name,
        site: site,
        cnpj: cnpj
      }
    }

    assert_response :created

    @company = JSON.parse(body, :symbolize_names => true)
    @company = @company[:company]
  end

  def invite_new_admin_and_register(params, company_id = 1, total_invites = 1)
    # Invite
    # POST - http://localhost:3000/companies/1/admins.json
    post "/companies/" + company_id.to_s + "/admins.json", { :admin_invite => { :email => params[:email] } }
    assert_response :success

    # Admis convidados deve ser maior que zero ou nesse caso igual a `total_invites`
    get '/companies/1/admins.json'
    assert_response :success

    data = JSON.parse(body, :symbolize_names => :true)
    assert_equal total_invites, data.count

    #Logoff do usuario atual
    logoff_user

    #Novo admin acessa pagina de cadastro com token
    get '/users/sign_up?admin_token=' + data[0][:token].to_s
    assert_response :success

    self.create_user(params)
  end

  def invite_new_member_and_register(params, company_id = 1, total_invites = 1)
    # Invite
    # POST - http://localhost:3000/companies/1/admins.json
    post "/companies/" + company_id.to_s + "/voters.json", { :voter_invite => { :email => params[:email] } }
    assert_response :success

    # Membros convidados deve ser maior que zero ou nesse caso igual a `total_invites`
    get '/companies/1/voters.json'
    assert_response :success
    data = JSON.parse(body, :symbolize_names => :true)
    assert_equal total_invites, data.count

    #Logoff do usuario atual
    logoff_user

    #Novo admin acessa pagina de cadastro com token
    get '/users/sign_up?voter_token=' + data[0][:token].to_s
    assert_response :success

    self.create_user(params)
  end
end
