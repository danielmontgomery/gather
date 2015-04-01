class Reference < ActiveRecord::Base
  belongs_to :user
  belongs_to :recipient_id, class_name: "User"
end
