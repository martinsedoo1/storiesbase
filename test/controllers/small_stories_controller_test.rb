require 'test_helper'

class SmallStoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @small_story = small_stories(:one)
  end

  test "should get index" do
    get small_stories_url, as: :json
    assert_response :success
  end

  test "should create small_story" do
    assert_difference('SmallStory.count') do
      post small_stories_url, params: { small_story: { description: @small_story.description, latitude: @small_story.latitude, longitude: @small_story.longitude, story_id: @small_story.story_id, title: @small_story.title } }, as: :json
    end

    assert_response 201
  end

  test "should show small_story" do
    get small_story_url(@small_story), as: :json
    assert_response :success
  end

  test "should update small_story" do
    patch small_story_url(@small_story), params: { small_story: { description: @small_story.description, latitude: @small_story.latitude, longitude: @small_story.longitude, story_id: @small_story.story_id, title: @small_story.title } }, as: :json
    assert_response 200
  end

  test "should destroy small_story" do
    assert_difference('SmallStory.count', -1) do
      delete small_story_url(@small_story), as: :json
    end

    assert_response 204
  end
end
