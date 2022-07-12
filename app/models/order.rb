# == Schema Information
#
# Table name: orders
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  product_id :bigint
#  user_id    :bigint
#  site_id    :bigint
#
class Order < ApplicationRecord
    belongs_to :product
    
    belongs_to :user
    belongs_to :site
    
end
