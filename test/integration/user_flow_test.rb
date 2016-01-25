require 'test_helper'

class UserFlowTest < ActionDispatch::IntegrationTest

  test "Acessa página de login" do
    get "/users/sign_in.json"
    assert_response :success
  end

  test "Tenta fazer o login e falha pois não esta cadastrado" do
    get "/users/sign_in.json"
    assert_response :success

    post_via_redirect "/users/sign_in.json", { :user => {
        :login => "joao@assembleias.com.br",
        :password => "super123"
    }}

    assert_response :unauthorized

  end

  test "Accesa página de cadastro e se cadastra" do
    get "/users/sign_up.json"
    assert_response :success

    create_user

    get "/admin/index"
    assert_response :success
  end

  test "Faz logoff do sistema e volta para tela inicial. Ao tentar acessar admin vai para tela de login" do
    create_user

    logoff_user

    get "/"
    assert_response :success

    get "/admin/index"
    assert_redirected_to "/users/sign_in"

    get "/users/sign_in.json"
    assert_response :success
  end

  test "Faz login e vai para tela de administracao do sistema" do
    create_user
    logoff_user

    post "/users/sign_in", { user: {
       login: "joao@assembleias.com.br",
       password: "super123",
       remember_me: 1
    }}

    assert_response :found

    get "/admin/index"
    assert_response :success

    logoff_user
  end

end
