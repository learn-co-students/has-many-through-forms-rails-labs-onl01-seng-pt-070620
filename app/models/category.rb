class Category < ActiveRecord::Base
  has_many :post_categories
  has_many :posts, through: :post_categories
  accepts_nested_attributes_for :posts
end
