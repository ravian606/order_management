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
#  recurring_interval :string(255)
#  state              :string(255)
#  monday             :string(255)
#  tuesday            :string(255)
#  wednesday          :string(255)
#  thursday           :string(255)
#  friday             :string(255)
#  saturday           :string(255)
#  sunday             :string(255)
#
class Order < ApplicationRecord
    #include ActiveModel::Transitions

    has_many :product_order_details, dependent: :destroy
    has_many :products, through: :product_order_details
    accepts_nested_attributes_for :product_order_details, allow_destroy: true, reject_if: :all_blank

    amoeba do
        enable
    end

    after_save :create_recurring_orders
    before_save :add_state_to_new_order

    belongs_to :user
    belongs_to :site

    REPEAT_INTERVAL = ['Daily', 'Weekly'].freeze
    RECURRING_INTERVAL = (1..31).to_a.freeze

    # state_machine do
    #     state :available # first one is initial state
    #     state :out_of_stock, :exit => :exit_out_of_stock
    #     state :discontinued, :enter => lambda { |product| product.cancel_orders }

    #     event :discontinued do
    #         transitions :to => :discontinued, :from => [:available, :out_of_stock], :on_transition => :do_discontinue
    #     end
    #     event :out_of_stock, :success => :reorder do
    #         transitions :to => :out_of_stock, :from => [:available, :discontinued]
    #     end
    #     event :available do
    #         transitions :to => :available, :from => [:out_of_stock], :guard => lambda { |product| product.in_stock > 0 }
    #     end
    # end

    private
    def create_recurring_orders
        return unless is_recurring

        convert_difference = 7 #repeat_interval == 'Daily' ? 1 : 7
        #difference = (recurring_end_date.to_date - delievery_date.to_date).to_i / convert_difference
        #byebug
        #self.errors.add(:base, "Recurring end date should be greater than delievery date") if difference <= 0
        #return if difference <= 0
        for i in 1..45
            new_order = self.amoeba_dup
            new_order.is_recurring = false
            new_order.delievery_date = new_order.delievery_date.to_date + (i * convert_difference)
            new_order.save
        end
    end

    def add_state_to_new_order
        return unless new_record?
        self.state = 'Started'
    end

    def add_delievery_date_to_order
        return unless new_record?
        self.delievery_date = Date.today + 1
    end
end
