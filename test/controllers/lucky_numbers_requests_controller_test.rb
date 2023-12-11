require "test_helper"

class LuckyNumbersRequestsControllerTest < ActionDispatch::IntegrationTest
  test "should get input" do
    get lucky_numbers_requests_input_url
    assert_response :success
  end

  test "should get view" do
    get lucky_numbers_requests_view_url
    assert_response :success
  end
end
