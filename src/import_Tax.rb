require_relative "constants"

class ImportTax
  def self.applies_to?(item)
    item.imported?
  end

  def self.tax_for(item)
    item.price * Constants::IMPORT_TAX_RATE
  end
end