class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  accepts_nested_attributes_for :user, reject_if: proc { |attributes| attributes[:username].blank? }

  def user_attributes=(user_attributes)
    user_attributes.values.each do |user_attribute|
      if !user_attribute[:username].empty?
      user = User.create(user_attribute)
      self.users << user
      end
    end
  end
end
