class ReportsController < ApplicationController
    def production_summary
        orders = Order.joins(:product_order_details, :products).where(delievery_date: Date.today..(Date.today + 7), state: 'Started').group('product_order_details.product_id','orders.delievery_date').sum('product_order_details.quantity::int')
        products = Product.all
        @report_data = prepare_production_summary_data(orders, products)
    end

    def orders_summary
        delievery_date = params[:delievery_date].present? ? params[:delievery_date] : Date.today
        @orders = Order.where(delievery_date: delievery_date, state: 'Started')
        @count_summary = Order.joins(:product_order_details).where(delievery_date: delievery_date, state: 'Started').group('product_order_details.order_id').sum('product_order_details.quantity::int')
    end

    private
    def display_delievery_day(delievery_date)
        %w[Sunday Monday Tuesday Wednesday Thursday Friday Saturday][delievery_date.wday]
    end

    def prepare_production_summary_data(orders, products)
        dummy_obj = {}
        dummy_obj[:product_name] = ''
        dummy_obj[:monday] = 0
        dummy_obj[:tuesday] = 0
        dummy_obj[:wednesday] = 0
        dummy_obj[:thursday] = 0
        dummy_obj[:friday] = 0
        dummy_obj[:saturday] = 0
        dummy_obj[:sunday] = 0

        report_data = []
        orders.each do |key, value|
            new_obj = {}
            new_obj.merge(dummy_obj)

            prod_id = key[0]
            prod_name = products.find(prod_id).name
            new_obj[:product_name] = prod_name

            day_name = display_delievery_day(Date.parse key[1].to_s)
            new_obj[day_name.downcase.to_sym] = value / 2
            report_data << new_obj
        end
        report_data
    end

    # def 
    #     require 'csv'
 
    #     file = "#{Rails.root}/public/data.csv"
        
    #     table = User.all;0 # ";0" stops output.  Change "User" to any model.
        
    #     CSV.open( file, 'w' ) do |writer|
    #         writer << table.first.attributes.map { |a,v| a }
    #         table.each do |s|
    #             writer << s.attributes.map { |a,v| v }
    #         end
    #     end
    # end
end
