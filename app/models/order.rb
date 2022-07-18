# == Schema Information
#
# Table name: orders
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#  site_id    :bigint
#
class Order < ApplicationRecord
    has_many :product_order_details
    has_many :products, through: :product_order_details
    accepts_nested_attributes_for :product_order_details

    belongs_to :user
    belongs_to :site
    
end
