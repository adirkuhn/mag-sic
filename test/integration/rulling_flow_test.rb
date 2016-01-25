require 'test_helper'

class RullingFlowTest < ActionDispatch::IntegrationTest

  def the_count_of_rulling_should_be(count, company_id = 1, moot_id = 1)
    get "/companies/" + company_id.to_s + "/moots/" + moot_id.to_s + "/rullings.json"
    @res = JSON.parse(body, :symbolize_names => true)

    assert_equal count, @res[:rullings].count
  end

  test "Admin CRUD de pauta" do
    create_user
    create_company
    create_moot

    # O numero de pautas deve ser 0
    the_count_of_rulling_should_be(0)

    # Admin cria uma nova pauta
    create_rulling

    # O numero de pautas deve ser 1
    the_count_of_rulling_should_be(1)

    # Admin edita a pauta
    rulling_data = {
      title: "Titulo editado",
      objective: "Objetivo editado",
      description: "Descrição editada"
    }

    put_via_redirect "/companies/1/moots/1/rullings/1.json", { rulling: rulling_data }
    assert_response :success
    res_rulling_data = JSON.parse(body, :symbolize_names => :true)

    assert_equal rulling_data, res_rulling_data[:rulling].extract!(:title, :objective, :description)

    # Admin acessa a pauta
    get "/companies/1/moots/1/rullings/1.json"
    assert_response :success

    # Admin delete a pauta
    delete "/companies/1/moots/1/rullings/1.json"
    assert_response :no_content
  end

  test "Membro CRUD de pauta" do
    create_user
    create_company
    create_moot
    create_rulling
    invite_new_member_and_register

    # O membro pode ver todas as pautas
    get "/companies/1/moots/1/rullings.json"
    assert_response :success

    # O membro pode ver uma pauta especifica
    get "/companies/1/moots/1/rullings/1.json"
    assert_response :success

    # O membro tenta criar uma pauta e não é autorizado
    create_rulling(Hash.new, :forbidden)

    # O membro tenta editar uma pauta e não é autorizado
    rulling_data = {
      title: "Titulo editado",
      objective: "Objetivo editado",
      description: "Descrição editada"
    }

    put_via_redirect "/companies/1/moots/1/rullings/1.json", { rulling: rulling_data }
    assert_response :forbidden

    # O membro tenta deletar uma pauta e não é autorizado
    delete "/companies/1/moots/1/rullings/1.json"
    assert_response :forbidden
  end

end
