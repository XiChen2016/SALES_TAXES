require 'rspec'
require_relative "../src/constants"
require_relative "../src/item"
require_relative "../src/import_tax"

describe ImportTax do
  before :each do
    @import_item = Item.new("box of imported books", "1", "24.50")
    @non_import_item = Item.new("box of perfume", "1", "24.50")
  end

  it "not apply import tax rule for the non import item" do
    ImportTax.applies_to?(@non_import_item).should == false
  end

  it "apply import tax rule for the import item" do
    ImportTax.applies_to?(@import_item).should == true
  end

  it "return the correct tax amount for the item" do
    ImportTax.tax_for(@import_item).should == 1.225
  end
end