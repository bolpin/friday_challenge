require "test_helper"

class TotalPayoutControllerTest < ActionDispatch::IntegrationTest
  test "should get payout" do
    get total_payout_url, params: { min_age: '21', max_age: '30' }

    assert_response :success
    assert_equal("$125.45", JSON.parse(response.body).first['amount'])
  end
end
