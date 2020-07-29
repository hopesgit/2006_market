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

  def test_it_can_check_stock
    vendor = Vendor.new("Rocky Mountain Fresh")
    item1 = Item.new({name: "Peach", price: "$0.75"})
    assert_equal 0, vendor.check_stock(item1)
  end
end
