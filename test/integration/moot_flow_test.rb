require 'test_helper'

class MootFlowTest < ActionDispatch::IntegrationTest

  def the_count_of_moots_should_be(count, company_id = 1)
    # http://localhost:3000/companies/1/moots.json
    get "/companies/" + company_id.to_s + "/moots.json"
    @res = JSON.parse(body, :symbolize_names => true)

    assert_equal count, @res[:moots].count
  end

  def the_count_of_moots_comments_should_be(count, company_id = 1, moot_id = 1)
    get "/companies/" + company_id.to_s + "/moots/" + moot_id.to_s + "/moot_comments.json"
    @res = JSON.parse(body, :symbolize_names => true)

    assert_equal count, @res.count
  end

  test "Admin cria nova assembleia" do
    create_user
    create_company

    moot_params = {
        title: "Assembleia numero uno",
        description: "uma assembleia qualquer",
        voting_start_at: Time.now.to_s,
        voting_ending_at: 30.days.from_now.to_s
    }
    create_moot(moot_params)

    # O total de assembleias deve ser igual a um
    the_count_of_moots_should_be(1)
  end

  test "Admin edita uma assembleia" do
    create_user
    create_company
    create_moot

    moot_data = {
      title: "Título alterado",
      description: "descrição alterada",
    }

    put_via_redirect "/companies/1/moots/1.json", { moot: moot_data }
    assert_response :success
    res_moot_data = JSON.parse(body, :symbolize_names => :true)
    assert_equal moot_data, res_moot_data[:moot].extract!(:title, :description)
  end

  test "Admin ve todas as assembleias e uma assembleia especifica" do
    create_user
    create_company
    create_moot

    get "/companies/1/moots.json"
    assert_response :success

    get "/companies/1/moots/1.json"
    assert_response :success
  end

  test "Admin deleta uma assembleia" do
    create_user
    create_company
    create_moot

    delete "/companies/1/moots/1.json"
    assert_response :no_content
  end

  test "Membro tenta criar, editar e deletar assembleia e pega erro de proibido" do
    create_user
    create_company
    create_moot
    invite_new_member_and_register

    # tenta criar nova assembleia
    create_moot(Hash.new, :forbidden)

    # tenta editar assembleia existente
    moot_data = {
      title: "Título alterado",
      description: "descrição alterada",
    }

    put_via_redirect "/companies/1/moots/1.json", { moot: moot_data }
    assert_response :forbidden

    # tenta deletar assembleia existente
    delete "/companies/1/moots/1.json"
    assert_response :forbidden
  end

  test "Membro ve todas as assembleias e uma assembleias expecifica" do
    create_user
    create_company
    create_moot
    invite_new_member_and_register

    get "/companies/1/moots.json"
    assert_response :success

    get "/companies/1/moots/1.json"
    assert_response :success
  end

  test "Admin e membro faz um comentario em uma assembleia" do
    create_user
    create_company
    create_moot

    # Sem comentarios no momento
    the_count_of_moots_comments_should_be(0)

    # Admin cria um comentario
    create_comment("um comentario")

    # Deve ter 1 comentario
    the_count_of_moots_comments_should_be(1)

    # Entra o usuario
    invite_new_member_and_register
    create_comment("outro comentario")

    # Deve ter 2 comentarios
    the_count_of_moots_comments_should_be(2)
  end
end
