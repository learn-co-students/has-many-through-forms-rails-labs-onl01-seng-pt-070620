class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments
  # accepts_nested_attributes_for :categories
  #
  def categories_attributes=(categories)
    categories.values.each do |category|
      unless category[:name].empty?
        cat = Category.find_or_create_by(name: category[:name])
        self.categories << cat
      end
    end
  end


end
