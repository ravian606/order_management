# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  name        :string(255)
#  size        :string(255)
#  packaging   :string(255)
#  description :text(65535)
#  price       :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Product < ApplicationRecord
    has_many :orders
end
