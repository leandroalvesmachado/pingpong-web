require "test_helper"

class Admin::TestesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_testis = admin_testes(:one)
  end

  test "should get index" do
    get admin_testes_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_testis_url
    assert_response :success
  end

  test "should create admin_testis" do
    assert_difference("Admin::Teste.count") do
      post admin_testes_url, params: { admin_testis: { nome: @admin_testis.nome } }
    end

    assert_redirected_to admin_testis_url(Admin::Teste.last)
  end

  test "should show admin_testis" do
    get admin_testis_url(@admin_testis)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_testis_url(@admin_testis)
    assert_response :success
  end

  test "should update admin_testis" do
    patch admin_testis_url(@admin_testis), params: { admin_testis: { nome: @admin_testis.nome } }
    assert_redirected_to admin_testis_url(@admin_testis)
  end

  test "should destroy admin_testis" do
    assert_difference("Admin::Teste.count", -1) do
      delete admin_testis_url(@admin_testis)
    end

    assert_redirected_to admin_testes_url
  end
end
