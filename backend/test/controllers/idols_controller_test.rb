require 'test_helper'

class IdolsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @idol = idols(:one)
  end

  test "should get index" do
    get idols_url, as: :json
    assert_response :success
  end

  test "should create idol" do
    assert_difference('Idol.count') do
      post idols_url, params: { idol: { detail: @idol.detail, image: @idol.image, name: @idol.name } }, as: :json
    end

    assert_response 201
  end

  test "should show idol" do
    get idol_url(@idol), as: :json
    assert_response :success
  end

  test "should update idol" do
    patch idol_url(@idol), params: { idol: { detail: @idol.detail, image: @idol.image, name: @idol.name } }, as: :json
    assert_response 200
  end

  test "should destroy idol" do
    assert_difference('Idol.count', -1) do
      delete idol_url(@idol), as: :json
    end

    assert_response 204
  end
end
