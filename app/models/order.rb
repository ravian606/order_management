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

    amoeba do
        enable
    end
    #proc { |att| att['name'].blank?}

    after_save :create_recurring_orders

    belongs_to :user
    belongs_to :site

    REPEAT_INTERVAL = ['Daily', 'Weekly'].freeze
    RECURRING_INTERVAL = (1..31).to_a.freeze

    private
    def create_recurring_orders
        return unless is_recurring

        convert_difference = repeat_interval == 'Daily' ? 1 : 7
        #difference = (recurring_end_date.to_date - delievery_date.to_date).to_i / convert_difference
        #byebug
        #self.errors.add(:base, "Recurring end date should be greater than delievery date") if difference <= 0
        #return if difference <= 0

        for i in 1..recurring_interval.to_i
            new_order = self.amoeba_dup
            new_order.is_recurring = false
            new_order.delievery_date = new_order.delievery_date.to_date + (i * convert_difference)
            new_order.save
        end
    end
end
