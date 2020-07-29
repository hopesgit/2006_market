require "./lib/item"

class Vendor
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new()
  end

  def check_stock(arg)
    if @inventory[:arg] == nil
      return 0
    else
      @inventory[:arg]
    end
  end
end
