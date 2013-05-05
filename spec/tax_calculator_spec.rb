require_relative "../src/constants"
require_relative "../src/item"
require_relative "../src/base_tax"
require_relative "../src/import_tax"
require_relative "../src/tax_calculator"

describe TaxCalculator do
  before :each do
    @import_item = Item.new("box of imported books", "1", "24.50")
    @non_import_item = Item.new("box of perfume", "2", "24.50")
  end

  context "applicable_taxes" do
    it "return the applicable tax names for the product" do
      TaxCalculator.applicable_taxes(@non_import_item).should == [BaseTax]
      TaxCalculator.applicable_taxes(@import_item).should == [ImportTax]
    end
  end

  context "tax_for" do
    it "return the tax amount for a single product" do
      TaxCalculator.tax_for(@import_item).round(2).should == 1.23
      TaxCalculator.tax_for(@non_import_item).round(2).should == 2.45
    end
  end

  context "total_tax" do
    it "return the total tax for the product" do
      TaxCalculator.total_tax(@import_item).round(2).should == 1.23
      TaxCalculator.total_tax(@non_import_item).round(2).should == 4.9
    end
  end

  context "calculate_taxes" do
    it "calculate the actual tax for the product" do
      TaxCalculator.calculate_taxes(@import_item).round(2).should == 1.25
      TaxCalculator.calculate_taxes(@non_import_item).round(2).should == 4.9
    end
  end

  context "calculate_price" do
    it "calculate the price of the product" do
      TaxCalculator.calculate_price(@import_item).round(2).should == 24.50
      TaxCalculator.calculate_price(@non_import_item).round(2).should == 49
    end
  end
end