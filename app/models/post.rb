class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments

  def categories_attributes=(category_attributes) #creating setting method to allow post model to access category attributes. macro is accepts_nested_attributes_for
    category_attributes.values.each do |category_attribute| #getting values of each category attribute
      if category_attribute[:name].present? #if name is present? we will find or create that category attribute(be in the checkbox, if not it will create it)
       category = Category.find_or_create_by(category_attribute)
      self.categories << category #post is self, will push in new category created
        if !self.categories.include?(category) 
        self.post_categories.build(category: params[:category]) #if it doesn't include category, calling on join table, build method 
        end
      end
    end
  end

  def comments_attributes=(comment_attributes)
    comment_attributes.values.each do |comment_attribute| 
      if comment_attribute[:content].present?
      comment = Comment.find_or_create_by(comment_attribute)
      self.comments << comment
      end
    end
  end
end











