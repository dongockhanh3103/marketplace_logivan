class ItemDiscount
    def initialize(item_id:, min_items:, discount:)
        @item_id = item_id
        @min_items = min_items
        @discount = discount
    end

    def apply(current_total, order)
        discount?(order) ? process_discount(order) : 0
    end

    def discount?(order)
        order[@item_id] >= @min_items
    end

    def process_discount(order)
        order[@item_id] * @discount
    end

end