require "./lib/market"
require "minitest/autorun"
require "minitest/pride"

market = Market.new("South Pearl Street Farmers Market")
vendor1 = Vendor.new("Rocky Mountain Fresh")
item1 = Item.new({name: 'Peach', price: "$0.75"})
item2 = Item.new({name: 'Tomato', price: "$0.50"})
item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
vendor2 = Vendor.new("Ba-Nom-a-Nom")
vendor3 = Vendor.new("Palisade Peach Shack")

class MarketTest < Minitest::Test

  def test_it_is_a_market
    market = Market.new("South Pearl Street Farmers Market")
    assert_instance_of Market, market
  end

  def test_it_has_attributes
    market = Market.new("South Pearl Street Farmers Market")
    assert_equal "South Pearl Street Farmers Market", market.name
    assert_equal [], market.vendors
  end

  def test_it_can_have_vendors
    market = Market.new("South Pearl Street Farmers Market")
    vendor1 = Vendor.new("Rocky Mountain Fresh")
    market.add_vendor(vendor1)

    assert_equal [vendor1], market.vendors
  end

  def test_the_vendors_have_names
    market = Market.new("South Pearl Street Farmers Market")
    vendor1 = Vendor.new("Rocky Mountain Fresh")
    vendor2 = Vendor.new("Ba-Nom-a-Nom")
    vendor3 = Vendor.new("Palisade Peach Shack")
    market.add_vendor(vendor1)
    market.add_vendor(vendor2)
    market.add_vendor(vendor3)

    assert_equal ["Rocky Mountain Fresh", "Ba-Nom-a-Nom", "Palisade Peach Shack"], market.vendor_names
  end

  def test_its_vendors_can_hold_items
    market = Market.new("South Pearl Street Farmers Market")
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
    market.add_vendor(vendor1)
    market.add_vendor(vendor2)
    market.add_vendor(vendor3)

  end
end
