module ReportsHelper
    def calculate_cost_including_vat(order_detail)
        total_cost = order_detail.quantity.to_i * order_detail.product.price.to_i
        inc_cost = order_detail.product.vat * 0.01 * total_cost

        total_cost + inc_cost
    end
end