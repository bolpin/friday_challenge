require "test_helper"

class DeviceTest < ActiveSupport::TestCase
  def setup
    @device = Device.new(model: "tablet",
                         os: "android",
                         version: "0.0.10",
                         locale: "en_CA")
  end

  test "valid device attributes" do
    assert @device.valid?
  end

  test "model is present" do
    @device.model = "  "
    refute @device.valid?
  end

  test "locale should be saved as lowercase" do
    mixed_case_locale = "eN_cA"
    @device.locale = mixed_case_locale
    @device.save
    assert_equal @device.reload.locale, mixed_case_locale.downcase
  end

  test "valid version formats" do
    valids = ["1.0.0", "444.444.22222222", "2.3.4-beta123abc"]
    for vers in valids do
      @device.version = vers
      assert @device.valid?, "#{vers} should be valid"
    end
  end

  test "invalid version formats" do
    invalids = [".0.0", "a.1.0", "1.0.0-a+b"]
    for vers in invalids do
      @device.version = vers
      refute @device.valid?, "#{vers} should not be valid"
    end
  end

end
