class Item
  attr_reader :name

  def initialize(details)
    @name = details[:name]
    @price = details[:price]
  end

  def price
    full_price = @price.slice!("$")
    full_price = @price
    full_price.to_f
  end
end
