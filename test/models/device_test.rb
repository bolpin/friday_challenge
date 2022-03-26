require "test_helper"

class DeviceTest < ActiveSupport::TestCase
  def setup
    valid_attributes = {
      model: "tablet",
      os_version: '1.0.0',
      operating_system: operating_systems(:android),
      locale: locales(:en_US),
      player: players(:reba)
    }

    @device = Device.new(valid_attributes)
  end

  test "valid device attributes" do
    assert @device.valid?
  end

  test "model is present" do
    @device.model = "    "
    refute @device.valid?
  end

  test "valid version formats" do
    valids = ["1.0.0", "444.444.22222222", "2.3.4-beta123abc"]
    for vers in valids do
      @device.os_version = vers
      assert @device.valid?, "#{vers} should be valid"
    end
  end

  test "invalid version formats" do
    invalids = [".0.0", "a.1.0", "1.0.0-a+b"]
    for vers in invalids do
      @device.os_version = vers
      refute @device.valid?, "#{vers} should not be valid"
    end
  end

end
