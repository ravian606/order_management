# == Schema Information
#
# Table name: contacts
#
#  id               :bigint           not null, primary key
#  title            :string(255)
#  first_name       :string(255)
#  last_name        :string(255)
#  number           :string(255)
#  street_address1  :string(255)
#  street_address2  :string(255)
#  town             :string(255)
#  post_code_string :string(255)
#  email            :string(255)
#  phone_number     :string(255)
#  head_office      :string(255)
#  buyer            :string(255)
#  invoice          :string(255)
#  site_id          :bigint           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  company_id       :bigint
#
class Contact < ApplicationRecord
  belongs_to :site
  belongs_to :company
end
