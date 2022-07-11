# == Schema Information
#
# Table name: sites
#
#  id                 :bigint           not null, primary key
#  name               :string(255)
#  number             :string(255)
#  street_address_one :string(255)
#  street_address_two :string(255)
#  town               :string(255)
#  post_code          :string(255)
#  head_office        :string(255)
#  invoice_address    :string(255)
#  contact            :string(255)
#  invoice_email      :string(255)
#  phone_number       :string(255)
#  payment_method     :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  company_id         :bigint
#
class Site < ApplicationRecord
    belongs_to :company
end
