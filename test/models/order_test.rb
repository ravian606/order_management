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
require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
