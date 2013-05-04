require_relative "constants"

class BaseTax
  def self.applies_to?(item)
    !item.tax_exempt?
  end

  def self.tax_for(item)
    item.price * Constants::BASE_TAX_RATE
  end
end