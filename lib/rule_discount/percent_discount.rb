class PercentDiscount
    def initialize(percent:, threshold:)
        @percent = percent
        @threshold = threshold
    end

    def apply(current_total, order)
        discount?(current_total) ? process_discount(current_total) : 0
    end

    def discount?(current_total)
        current_total >= @threshold
    end

    def process_discount(current_total)
        current_total * @percent / 100
    end
end