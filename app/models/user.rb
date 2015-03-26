class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :trip_users
  has_many :comments
  has_many :references
  has_many :trips_organized, class_name: "Trip", foreign_key: :organizer_id, inverse_of: :organizer
end


