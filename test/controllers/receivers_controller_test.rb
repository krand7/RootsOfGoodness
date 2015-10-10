require 'test_helper'

class ReceiversControllerTest < ActionController::TestCase
  setup do
    @receiver = receivers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:receivers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create receiver with just name" do
    assert_difference('Receiver.count') do
      post :create, receiver: { name: 'new receiver name' }
    end

    assert_redirected_to new_receiver_tribute_path(assigns(:receiver))
  end

  test "should show receiver" do
    get :show, id: @receiver
    assert_response :success
  end

  test "should not get edit" do
    get :edit, id: @receiver
    assert_redirected_to @receiver
  end

  test "should update receiver" do
    patch :update, id: @receiver, receiver: { email: @receiver.email, name: @receiver.name, photo: @receiver.photo, trees: @receiver.trees }
    assert_redirected_to receiver_path(assigns(:receiver))
  end

  test "should destroy receiver" do
    assert_difference('Receiver.current.count', -1) do
      delete :destroy, id: @receiver
    end

    assert_redirected_to receivers_path
  end
end
