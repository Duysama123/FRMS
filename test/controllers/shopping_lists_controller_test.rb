require "test_helper"

class ShoppingListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shopping_list = shopping_lists(:one)
  end

  test "should get index" do
    get shopping_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_shopping_list_url
    assert_response :success
  end

  test "should create shopping_list" do
    assert_difference("ShoppingList.count") do
      post shopping_lists_url, params: { shopping_list: { account_id: @shopping_list.account_id, ingredient_id: @shopping_list.ingredient_id, purchased: @shopping_list.purchased, quantity: @shopping_list.quantity, recipe_id: @shopping_list.recipe_id, unit: @shopping_list.unit } }
    end

    assert_redirected_to shopping_list_url(ShoppingList.last)
  end

  test "should show shopping_list" do
    get shopping_list_url(@shopping_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_shopping_list_url(@shopping_list)
    assert_response :success
  end

  test "should update shopping_list" do
    patch shopping_list_url(@shopping_list), params: { shopping_list: { account_id: @shopping_list.account_id, ingredient_id: @shopping_list.ingredient_id, purchased: @shopping_list.purchased, quantity: @shopping_list.quantity, recipe_id: @shopping_list.recipe_id, unit: @shopping_list.unit } }
    assert_redirected_to shopping_list_url(@shopping_list)
  end

  test "should destroy shopping_list" do
    assert_difference("ShoppingList.count", -1) do
      delete shopping_list_url(@shopping_list)
    end

    assert_redirected_to shopping_lists_url
  end
end
