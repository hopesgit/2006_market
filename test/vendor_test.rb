require "./lib/vendor"
require "minitest/autorun"
require "minitest/pride"

class VendorTest < Minitest::Test

  def test_it_is_a_vendor
    vendor = Vendor.new("Rocky Mountain Fresh")
    assert_instance_of Vendor, vendor
  end

  def test_it_has_attributes
    vendor = Vendor.new("Rocky Mountain Fresh")

    assert_equal "Rocky Mountain Fresh", vendor.name
    assert_instance_of Hash, vendor.inventory
  end
end
