require "test_helper"

class VictoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @victory = victories(:one)
  end

  test "should get index" do
    get victories_url
    assert_response :success
  end

  test "should get new" do
    get new_victory_url
    assert_response :success
  end

  test "should create victory" do
    assert_difference("Victory.count") do
      post victories_url, params: { victory: { content: @victory.content, title: @victory.title } }
    end

    assert_redirected_to victory_url(Victory.last)
  end

  test "should show victory" do
    get victory_url(@victory)
    assert_response :success
  end

  test "should get edit" do
    get edit_victory_url(@victory)
    assert_response :success
  end

  test "should update victory" do
    patch victory_url(@victory), params: { victory: { content: @victory.content, title: @victory.title } }
    assert_redirected_to victory_url(@victory)
  end

  test "should destroy victory" do
    assert_difference("Victory.count", -1) do
      delete victory_url(@victory)
    end

    assert_redirected_to victories_url
  end
end
