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
require 'test_helper'

class ProductOrderDetailTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
