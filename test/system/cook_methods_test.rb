require "application_system_test_case"

class CookMethodsTest < ApplicationSystemTestCase
  setup do
    @cook_method = cook_methods(:one)
  end

  test "visiting the index" do
    visit cook_methods_url
    assert_selector "h1", text: "Cook methods"
  end

  test "should create cook method" do
    visit cook_methods_url
    click_on "New cook method"

    fill_in "Description", with: @cook_method.description
    fill_in "Name", with: @cook_method.name
    click_on "Create Cook method"

    assert_text "Cook method was successfully created"
    click_on "Back"
  end

  test "should update Cook method" do
    visit cook_method_url(@cook_method)
    click_on "Edit this cook method", match: :first

    fill_in "Description", with: @cook_method.description
    fill_in "Name", with: @cook_method.name
    click_on "Update Cook method"

    assert_text "Cook method was successfully updated"
    click_on "Back"
  end

  test "should destroy Cook method" do
    visit cook_method_url(@cook_method)
    click_on "Destroy this cook method", match: :first

    assert_text "Cook method was successfully destroyed"
  end
end
