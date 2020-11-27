class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  accepts_nested_attributes_for :user, reject_if: proc { |attributes| attributes['username'].blank?}

  def user_attributes(user_attribute)
    user_attribute.values.each do |attribute|
      if attribute[:username].present?
        user = User.find_or_create_by(attribute)
        if !self.user = user
          self.build_user(:username => user[:username])
        end
      end
    end
  end
end



