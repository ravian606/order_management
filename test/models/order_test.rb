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
require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
