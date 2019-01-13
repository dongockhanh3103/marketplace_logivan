class Basket
    def initialize(promotional_rules)
        @promotional_rules = promotional_rules
        @products = Array.new
    end

    def total(order)
        apply_discount(total_without_discount(order), order)
    end

    def push_product(item)
        @products << item
    end

    def total_without_discount(order)
        order.reduce(0) do |sum, (item_id, quan)|
            sum += cost(item_id, quan)
        end
    end

    def apply_discount(total_without_discount, order)
        @promotional_rules.reduce(total_without_discount) do |current_total, rule|
            current_total - rule.apply(current_total, order)
        end
    end

    def cost(item_id, quan)
        products_with_price(@products)[item_id] * quan
    end

    def products_with_price(products)
        products.map { |product| [product.id, product.price] }.to_h
    end
end