require "test_helper"

class NutritionInfosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @nutrition_info = nutrition_infos(:one)
  end

  test "should get index" do
    get nutrition_infos_url
    assert_response :success
  end

  test "should get new" do
    get new_nutrition_info_url
    assert_response :success
  end

  test "should create nutrition_info" do
    assert_difference("NutritionInfo.count") do
      post nutrition_infos_url, params: { nutrition_info: { calories: @nutrition_info.calories, carbs: @nutrition_info.carbs, fat: @nutrition_info.fat, fiber: @nutrition_info.fiber, ingredient_id: @nutrition_info.ingredient_id, protein: @nutrition_info.protein, sugar: @nutrition_info.sugar } }
    end

    assert_redirected_to nutrition_info_url(NutritionInfo.last)
  end

  test "should show nutrition_info" do
    get nutrition_info_url(@nutrition_info)
    assert_response :success
  end

  test "should get edit" do
    get edit_nutrition_info_url(@nutrition_info)
    assert_response :success
  end

  test "should update nutrition_info" do
    patch nutrition_info_url(@nutrition_info), params: { nutrition_info: { calories: @nutrition_info.calories, carbs: @nutrition_info.carbs, fat: @nutrition_info.fat, fiber: @nutrition_info.fiber, ingredient_id: @nutrition_info.ingredient_id, protein: @nutrition_info.protein, sugar: @nutrition_info.sugar } }
    assert_redirected_to nutrition_info_url(@nutrition_info)
  end

  test "should destroy nutrition_info" do
    assert_difference("NutritionInfo.count", -1) do
      delete nutrition_info_url(@nutrition_info)
    end

    assert_redirected_to nutrition_infos_url
  end
end
