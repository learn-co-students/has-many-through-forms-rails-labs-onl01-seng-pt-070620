class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments

  def categories_attributes=(categories_hashes)
    categories_hashes.each do |index, category_attribute|
      if category_attribute[:name].present?
        category = Category.find_or_create_by(category_attribute)
        self.post_categories.build(category: category)
      #self.categories << category ---will return all categories
      end
    end
  end

  # <% Category.all.each do |category|%>
  #   <p>
  #   <label for="category_id <%= category.id %>"><%= category.name %></label>
  #   <input type="checkbox" name="post[category_ids][]" value="<%=category.id %>" id="category_id <%=category.id%>">
  #   </p >
  #   <% end %>

  #<%= f.collection_check_boxes :category_ids, Category.all, :id, :name %>

  # <%= f.fields_for :categories, post.categories.build do |categories_fields| %>
  #   <%= categories_fields.text_field :name %>

  #<input type="text" id="post_categories_attributes_0_name" name="post[categories_attributes][0][name]">

end
