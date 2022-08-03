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
class Company < ApplicationRecord
    has_many :sites, :dependent => :delete_all
    has_many :contacts, :dependent => :delete_all
end
