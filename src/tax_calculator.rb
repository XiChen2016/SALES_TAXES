require_relative "constants"
require_relative "base_tax"
require_relative "import_tax"

class TaxCalculator
  @@tax_rules = [BaseTax, ImportTax]

  def self.applicable_taxes(item)
    applicable_taxes ||= []
    @@tax_rules.each do |tr|
      applicable_taxes << tr if tr.applies_to? item
    end
    applicable_taxes
  end

  def self.tax_for(item)
    taxes = applicable_taxes(item).map { |at| at.tax_for item }
    result = 0
    taxes.each do |t|
      result += t
    end
    result
  end

  def self.total_tax(item)
    (item.quantity() * tax_for(item))
  end

  def self.calculate_taxes(item)
    rounding_coefficient = 1 / Constants::ROUNDING_TO_THE_NEAREST_FACTOR
    (rounding_coefficient * total_tax(item)).ceil / rounding_coefficient
  end

  def self.calculate_price(item)
    item.quantity() * item.price()
  end
end