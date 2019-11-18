class Product < ApplicationRecord
  belongs_to :user
  has_many :order_items

 scope :available, -> { where("amount > 0")}

end
