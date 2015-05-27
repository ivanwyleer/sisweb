require 'test_helper'

class MensagensControllerTest < ActionController::TestCase
  setup do
    @mensagen = mensagens(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mensagens)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mensagen" do
    assert_difference('Mensagen.count') do
      post :create, mensagen: { email: @mensagen.email, id_mensagem: @mensagen.id_mensagem, mensagem: @mensagen.mensagem, nome: @mensagen.nome }
    end

    assert_redirected_to mensagen_path(assigns(:mensagen))
  end

  test "should show mensagen" do
    get :show, id: @mensagen
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mensagen
    assert_response :success
  end

  test "should update mensagen" do
    patch :update, id: @mensagen, mensagen: { email: @mensagen.email, id_mensagem: @mensagen.id_mensagem, mensagem: @mensagen.mensagem, nome: @mensagen.nome }
    assert_redirected_to mensagen_path(assigns(:mensagen))
  end

  test "should destroy mensagen" do
    assert_difference('Mensagen.count', -1) do
      delete :destroy, id: @mensagen
    end

    assert_redirected_to mensagens_path
  end
end
