require 'test_helper'

class TributesControllerTest < ActionController::TestCase
  setup do
    @receiver = receivers(:one)
    @tribute = tributes(:one)
  end

  test "should get index" do
    get :index, receiver_id: @receiver
    assert_response :success
    assert_not_nil assigns(:tributes)
  end

  test "should get new" do
    get :new, receiver_id: @receiver
    assert_response :success
  end

  test "should create tribute" do
    assert_difference('Tribute.count') do
      post :create, receiver_id: @receiver, tribute: { description: 'Great person', created_by: 'Me', email: 'giver@giver.org' }
    end

    assert_redirected_to receiver_tribute_path(assigns(:receiver), assigns(:tribute))
  end

  test "should show tribute" do
    get :show, receiver_id: @receiver, id: @tribute
    assert_response :success
  end

  test "should get edit" do
    get :edit, receiver_id: @receiver, id: @tribute
    assert_response :success
  end

  test "should update tribute" do
    patch :update, receiver_id: @receiver, id: @tribute, tribute: { description: 'Awesome person' }
    assert_redirected_to receiver_tribute_path(assigns(:receiver), assigns(:tribute))
  end

  test "should destroy tribute" do
    assert_difference('Tribute.current.count', -1) do
      delete :destroy, receiver_id: @receiver, id: @tribute
    end

    assert_redirected_to receiver_path(@receiver)
  end
end
