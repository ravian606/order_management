module ProductsHelper
    def calculate_total_cost_of_product(qty, cost)
        qty.to_i * cost.to_i
    end
end
