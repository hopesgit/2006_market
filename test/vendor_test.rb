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

  def test_vendor_can_stock_items
    vendor = Vendor.new("Rocky Mountain Fresh")
    item1 = Item.new({name: "Peach", price: "$0.75"})
    vendor.stock(item1, 30)

    assert_equal 30, vendor.check_stock(item1)

    vendor.stock(item1, 25)

    assert_equal 55, vendor.check_stock(item1)
  end

  def test_vendor_has_many_items_in_inventory
    vendor = Vendor.new("Rocky Mountain Fresh")
    item1 = Item.new({name: "Peach", price: "$0.75"})
    item2 = Item.new({name: "Tomato", price: "$0.50"})
    vendor.stock(item1, 55)
    vendor.stock(item2, 12)

    assert_equal [item1, item2], vendor.inventory.keys
    assert_equal [55, 12], vendor.inventory.values
  end

  def test_vendors_can_get_potential_revenue
    vendor1 = Vendor.new("Rocky Mountain Fresh")
    item1 = Item.new({name: 'Peach', price: "$0.75"})
    item2 = Item.new({name: 'Tomato', price: "$0.50"})
    item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    vendor2 = Vendor.new("Ba-Nom-a-Nom")
    vendor3 = Vendor.new("Palisade Peach Shack")
    vendor1.stock(item1, 35)
    vendor1.stock(item2, 7)
    vendor2.stock(item4, 50)
    vendor2.stock(item3, 25)
    vendor3.stock(item1, 65)

    assert_equal 29.75, vendor1.potential_revenue
    assert_equal 345.00, vendor2.potential_revenue
    assert_equal 48.75, vendor3.potential_revenue
  end
end
