require_relative "constants"
class Item
  attr_accessor :quantity, :price, :name, :tax

  def initialize(name, quantity, price)
    @name = name
    @quantity = quantity.to_i
    @price = price.to_f
  end

  def imported?
    !!(@name =~ /imported/)
  end

  def tax_exempt?
    Constants::EXEMPTION_ITEMS.any? { |name| @name =~ /#{name}/ }
  end
end