require "test_helper"

class CookMethodsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cook_method = cook_methods(:one)
  end

  test "should get index" do
    get cook_methods_url
    assert_response :success
  end

  test "should get new" do
    get new_cook_method_url
    assert_response :success
  end

  test "should create cook_method" do
    assert_difference("CookMethod.count") do
      post cook_methods_url, params: { cook_method: { description: @cook_method.description, name: @cook_method.name } }
    end

    assert_redirected_to cook_method_url(CookMethod.last)
  end

  test "should show cook_method" do
    get cook_method_url(@cook_method)
    assert_response :success
  end

  test "should get edit" do
    get edit_cook_method_url(@cook_method)
    assert_response :success
  end

  test "should update cook_method" do
    patch cook_method_url(@cook_method), params: { cook_method: { description: @cook_method.description, name: @cook_method.name } }
    assert_redirected_to cook_method_url(@cook_method)
  end

  test "should destroy cook_method" do
    assert_difference("CookMethod.count", -1) do
      delete cook_method_url(@cook_method)
    end

    assert_redirected_to cook_methods_url
  end
end
