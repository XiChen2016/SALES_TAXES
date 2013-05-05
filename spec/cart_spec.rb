require_relative "../src/cart"
require_relative "../src/item"

describe Cart do
  let(:item1) { Item.new("book", 1, 12.03) }
  let(:item2) { Item.new("perfume", 2, 10.39) }
  let(:cart) { Cart.new() }

  context "add" do
    it "add items to the cart" do
      cart.add(item1)
      cart.add(item2)
      cart.items.should == [item1, item2]
    end
  end
end