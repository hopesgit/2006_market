require "./lib/item"
require "minitest/autorun"
require "minitest/pride"

class ItemTest < Minitest::Test

  def test_it_is_an_item
    item = Item.new({name: "Peach", price: "$0.75"})
    assert_instance_of Item, item
  end

  def test_it_has_attributes
    item2 = Item.new({name: "Tomato", price: "$0.50"})
    assert_equal "Tomato", item2.name
    assert_equal 0.5, item2.price
  end
end
