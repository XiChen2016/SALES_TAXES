class Cart
  attr_accessor :items

  def initialize
    @items = Array.new
  end

  def add(item)
    @items.push(item)
  end
end