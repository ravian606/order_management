module OrdersHelper
    def display_delievery_day(delievery_date)
        %w[Sunday Monday Tuesday Wednesday Thursday Friday Saturday][delievery_date.wday]
    end
     
end
