# == Schema Information
#
# Table name: product_order_details
#
#  id                   :bigint           not null, primary key
#  product_id           :bigint           not null
#  order_id             :bigint           not null
#  quantity             :string(255)
#  special_instructions :string(255)
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
class ProductOrderDetail < ApplicationRecord
  belongs_to :product
  belongs_to :order
end
