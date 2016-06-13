require 'test_helper'

class GategoriesControllerTest < ActionController::TestCase
  setup do
    @gategory = gategories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gategory" do
    assert_difference('Gategory.count') do
      post :create, gategory: { description: @gategory.description, fl_status: @gategory.fl_status, name: @gategory.name, title: @gategory.title }
    end

    assert_redirected_to gategory_path(assigns(:gategory))
  end

  test "should show gategory" do
    get :show, id: @gategory
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gategory
    assert_response :success
  end

  test "should update gategory" do
    patch :update, id: @gategory, gategory: { description: @gategory.description, fl_status: @gategory.fl_status, name: @gategory.name, title: @gategory.title }
    assert_redirected_to gategory_path(assigns(:gategory))
  end

  test "should destroy gategory" do
    assert_difference('Gategory.count', -1) do
      delete :destroy, id: @gategory
    end

    assert_redirected_to gategories_path
  end
end
