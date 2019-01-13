require_relative 'basket'
class Checkout
    def initialize(promotional_rules)
        @promotional_rules = promotional_rules
        @order = Hash.new(0)
        @basket = Basket.new(promotional_rules)
    end

    def scan(item)
        @order[item.id] += 1
        @basket.push_product(item)
    end

    def total
        @basket.total(@order)
    end

    def print_order
        p "Basket: " + @order.keys.to_a.join(',').to_s
        p "Total price: " + total.to_s
    end
end