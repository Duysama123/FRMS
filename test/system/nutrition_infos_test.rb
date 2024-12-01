require "application_system_test_case"

class NutritionInfosTest < ApplicationSystemTestCase
  setup do
    @nutrition_info = nutrition_infos(:one)
  end

  test "visiting the index" do
    visit nutrition_infos_url
    assert_selector "h1", text: "Nutrition infos"
  end

  test "should create nutrition info" do
    visit nutrition_infos_url
    click_on "New nutrition info"

    fill_in "Calories", with: @nutrition_info.calories
    fill_in "Carbs", with: @nutrition_info.carbs
    fill_in "Fat", with: @nutrition_info.fat
    fill_in "Fiber", with: @nutrition_info.fiber
    fill_in "Ingredient", with: @nutrition_info.ingredient_id
    fill_in "Protein", with: @nutrition_info.protein
    fill_in "Sugar", with: @nutrition_info.sugar
    click_on "Create Nutrition info"

    assert_text "Nutrition info was successfully created"
    click_on "Back"
  end

  test "should update Nutrition info" do
    visit nutrition_info_url(@nutrition_info)
    click_on "Edit this nutrition info", match: :first

    fill_in "Calories", with: @nutrition_info.calories
    fill_in "Carbs", with: @nutrition_info.carbs
    fill_in "Fat", with: @nutrition_info.fat
    fill_in "Fiber", with: @nutrition_info.fiber
    fill_in "Ingredient", with: @nutrition_info.ingredient_id
    fill_in "Protein", with: @nutrition_info.protein
    fill_in "Sugar", with: @nutrition_info.sugar
    click_on "Update Nutrition info"

    assert_text "Nutrition info was successfully updated"
    click_on "Back"
  end

  test "should destroy Nutrition info" do
    visit nutrition_info_url(@nutrition_info)
    click_on "Destroy this nutrition info", match: :first

    assert_text "Nutrition info was successfully destroyed"
  end
end
