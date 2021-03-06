# == Schema Information
#
# Table name: companies
#
#  id         :bigint           not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Company < ApplicationRecord
    has_many :sites, :dependent => :delete_all
    has_many :contacts, :dependent => :delete_all
end
