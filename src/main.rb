require_relative "item"
require_relative "tax_calculator"
require_relative "cart"

total_price = 0
total_tax = 0
cart = Cart.new()

while !ARGF.eof
  line = ARGF.gets
  item_quantity = line.split().first()
  tokens = line.split(/ at /)
  item_price = tokens.last().strip()
  item_name = tokens.first().split(item_quantity).last().strip()
  item = Item.new(item_name, item_quantity, item_price)
  cart.add(item)
end

cart.items().each do |item|
  item.tax=TaxCalculator.calculate_taxes(item)
  total_price += TaxCalculator.calculate_price(item)
  total_tax += TaxCalculator.calculate_taxes(item)
  puts item
end
puts "Sales Taxes: #{total_tax.round(2)}"
puts "Total: #{(total_price + total_tax).round(2)}"