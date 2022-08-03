# == Schema Information
#
# Table name: companies
#
#  id                 :bigint           not null, primary key
#  name               :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  number             :string(255)
#  street_address_one :string(255)
#  street_address_two :string(255)
#  town               :string(255)
#  post_code          :string(255)
#  head_office        :string(255)
#  invoice_address    :string(255)
#  contact            :string(255)
#
require 'test_helper'

class CompanyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
