# == Schema Information
#
# Table name: orders
#
#  id                 :bigint           not null, primary key
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  user_id            :bigint
#  site_id            :bigint
#  is_recurring       :boolean          default(FALSE)
#  repeat_interval    :string(255)
#  delievery_date     :datetime
#  recurring_end_date :datetime
#
class Order < ApplicationRecord
    has_many :product_order_details, dependent: :destroy
    has_many :products, through: :product_order_details
    accepts_nested_attributes_for :product_order_details, allow_destroy: true, reject_if: :all_blank
    #proc { |att| att['name'].blank?}

    belongs_to :user
    belongs_to :site

    REPEAT_INTERVAL = ['Daily', 'Weekly', 'Monthly'].freeze
end
