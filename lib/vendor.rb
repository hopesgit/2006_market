require "./lib/item"

class Vendor
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(arg)
    @inventory[arg]
  end

  def stock(item, qty)
    @inventory[item] += qty
  end

  def potential_revenue
    @inventory.keys.sum do |item|
      item.price * inventory[item]
    end
  end
end
