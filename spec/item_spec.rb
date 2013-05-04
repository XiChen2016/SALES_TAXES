require 'rspec'
require_relative "../src/item"

describe Item do
  before :each do
    @item = Item.new("box of books", "1", "24.50")
  end

  context "imported?" do
    it "return false if the item is not imported" do
      @item.name=("box of books")
      @item.imported?.should == false
    end

    it "return true if the item is imported" do
      @item.name=("box of imported books")
      @item.imported?.should == true
    end
  end

  context "tax_exempt?" do
    it "return false if the item is not exempt" do
      @item.name=("box of perfume")
      @item.tax_exempt?.should == false
    end

    it "return true if the item is exempt" do
      @item.name=("box of imported books")
      @item.tax_exempt?.should == true
    end
  end
end