require "./lib/market"
require "minitest/autorun"
require "minitest/pride"

class MarketTest < Minitest::Test

  def test_it_is_a_market
    market = Market.new("South Pearl Street Farmers Market")
    assert_instance_of Market, market
  end

end
