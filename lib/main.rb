require_relative "checkout"
require_relative "item"
require_relative "rule_discount/item_discount"
require_relative "rule_discount/percent_discount"
class Main
    item01 = Item.new(id: '001', name: 'Lavender heart', price: 9.25)
    item02 =  Item.new(id: '002', name: 'Personalised cufflinks', price: 45.00)
    item03 = Item.new(id: '003', name: 'Kids T-shirt', price: 19.95)

    products = [item01, item02, item03]

    lavender_discount = ItemDiscount.new(item_id: "001",min_items: 2,discount: 0.75)
    pricing_discount = PercentDiscount.new(percent: 10, threshold: 60)

    promotional_rules = [lavender_discount, pricing_discount]

    cart = Checkout.new(promotional_rules)

    cart.scan(item01)
    cart.scan(item03)
    cart.scan(item01)
    cart.scan(item02)

    cart.print_order

end