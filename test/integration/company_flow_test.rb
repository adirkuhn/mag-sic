require 'test_helper'

class CompanyFlowTest < ActionDispatch::IntegrationTest

  def the_count_of_companies_should_be(count)
    # http://localhost:3000/companies.json
    get "/companies.json"
    @res = JSON.parse(body, :symbolize_names => true)

    assert_equal count, @res[:companies].count
  end

  test "lista empresas atuais e deve ser igual a zero" do
    create_user

    # http://localhost:3000/companies.json
    the_count_of_companies_should_be 0
  end

  test "Cria nova empresa e o total de empresas deve ser igual a 1 (um)" do
    create_user

    # http://localhost:3000/companies.json
    company_data = {
      :name => "Compania de teste",
      :site => "http://site.com.br",
      :cnpj => "09999999000199"
    }

    create_company (company_data)
    assert_response :created

    the_count_of_companies_should_be 1

    data = @res[:companies][0]
    assert_equal company_data, data.extract!(:name, :site, :cnpj).to_h
  end

  test "Edita as informacoes da empresa" do
    create_user
    create_company

    company_data = {
      :company => {
        :name => "Compania de teste ALTERADO",
        :site => "http://alterado.com.br",
        :cnpj => "06666666000166"
      }
    }

    # PUT http://localhost:3000/companies/1
    put_via_redirect "/companies/1", company_data
    assert_response :success

    # GET http://localhost:3000/companies/1
    get "/companies/1.json"

    data = JSON.parse(body, :symbolize_names => :true)
    data = data[:company].extract!(:name, :site, :cnpj)

    assert_equal company_data[:company], data
  end

  test "Membros deve ser igual a um" do
    create_user
    create_company

    # http://localhost:3000/companies/1/members
    get companies_members_path(@company)
    assert_response :success

    @res = JSON.parse(body, :symbolize_names => true)
    assert_equal 1, @res.count
  end

  test "Convidar um novo administrador e um novo membro" do
    create_user
    create_company

    admin_data = {
      :email => "fulano_admin@admin.com",
      :password => "super123",
      :name => "Fulano Admin",
      :cpf => "01198819919",
      :securityQuestion1_id => 2,
      :securityAnswer1 => "recupera"
    }
    invite_new_admin_and_register(admin_data)

    res_admin_data = JSON.parse(body, :symbolize_names => :true)
    assert_equal(
      admin_data.extract!(:email, :name, :cpf),
      res_admin_data.extract!(:email, :name, :cpf)
    )

    #Acessa a empresa
    get "/companies/1.json"
    assert_response :success

    #Ve a lista de membros da empresa e deve ser 2
    get "/companies/1/members"
    assert_response :success

    @res = JSON.parse(body, :symbolize_names => true)
    assert_equal 2, @res.count

    #Ve a lista de Admins da empresa e deve ser 2
    get "/companies/1/members_admins"
    assert_response :success

    @res = JSON.parse(body, :symbolize_names => true)

    assert_equal 2, @res.count

    #Admin convida um novo membro
    member_data = {
      :email => "invited_user@gmail.com",
      :password => "super123",
      :name => "Ciclano membro",
      :cpf => "01111111211",
      :securityQuestion1_id => 2,
      :securityAnswer1 => "recupera"
    }

    #Se cadastra no site e vira membro da empresa em que foi convidado
    invite_new_member_and_register(member_data)

    res_member_data = JSON.parse(body, :symbolize_names => :true)

    assert_equal(
      member_data.extract!(:email, :name, :cpf),
      res_member_data.extract!(:email, :name, :cpf)
    )

    #Ve a lista de membros da empresa e deve ser 3
    get "/companies/1/members.json"
    assert_response :success
    @res = JSON.parse(body, :symbolize_names => true)
    assert_equal 3, @res.count

    #Tenta acessar a lista de admins mas o acesso é negado
    get "/companies/1/admins.json"
    assert_response :forbidden
  end
end
