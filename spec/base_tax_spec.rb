require 'rspec'
require_relative "../src/constants"
require_relative "../src/item"
require_relative "../src/base_tax"

describe BaseTax do
  before :each do
    @exempt_item = Item.new("box of imported books", "1", "24.50")
    @non_exempt_item = Item.new("box of perfume", "1", "24.50")
  end

  it "not apply base tax rule for the exempt item" do
    BaseTax.applies_to?(@exempt_item).should == false
  end

  it "apply base tax rule for the non exempt item" do
    BaseTax.applies_to?(@non_exempt_item).should == true
  end

  it "return the correct tax amount for the item" do
    BaseTax.tax_for(@non_exempt_item).should == 2.45
  end
end