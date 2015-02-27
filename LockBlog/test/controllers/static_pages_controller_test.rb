require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get menna" do
    get :menna
    assert_response :success
  end

  test "should get amira" do
    get :amira
    assert_response :success
  end

  test "should get rania" do
    get :rania
    assert_response :success
  end

  test "should get khalid" do
    get :khalid
    assert_response :success
  end

  test "should get omar" do
    get :omar
    assert_response :success
  end

  test "should get kareem" do
    get :kareem
    assert_response :success
  end

  test "should get doola" do
    get :doola
    assert_response :success
  end

  test "should get hagin" do
    get :hagin
    assert_response :success
  end

  test "should get hossam" do
    get :hossam
    assert_response :success
  end

end
