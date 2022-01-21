require "application_system_test_case"

class VictoriesTest < ApplicationSystemTestCase
  setup do
    @victory = victories(:one)
  end

  test "visiting the index" do
    visit victories_url
    assert_selector "h1", text: "Victories"
  end

  test "should create victory" do
    visit victories_url
    click_on "New victory"

    fill_in "Content", with: @victory.content
    fill_in "Title", with: @victory.title
    click_on "Create Victory"

    assert_text "Victory was successfully created"
    click_on "Back"
  end

  test "should update Victory" do
    visit victory_url(@victory)
    click_on "Edit this victory", match: :first

    fill_in "Content", with: @victory.content
    fill_in "Title", with: @victory.title
    click_on "Update Victory"

    assert_text "Victory was successfully updated"
    click_on "Back"
  end

  test "should destroy Victory" do
    visit victory_url(@victory)
    click_on "Destroy this victory", match: :first

    assert_text "Victory was successfully destroyed"
  end
end
