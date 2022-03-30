require "test_helper"

class DeviceCountControllerTest < ActionDispatch::IntegrationTest
  test "should get device count" do
    get device_count_url, params: { os: 'android', min_vers: '1.2.3', max_vers: '10' }

    assert_response :success
    assert_equal(4, JSON.parse(response.body).first['count'])
  end
end
