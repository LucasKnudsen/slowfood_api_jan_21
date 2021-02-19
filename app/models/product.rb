class Product < ApplicationRecord
  validates_presence_of :title, :description, :price
  has_many :items
end
