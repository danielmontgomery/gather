class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :trip_users
  has_many :comments
  has_many :references
  has_many :trips_organized, class_name: "Trip", foreign_key: :organizer_id, inverse_of: :organizer
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "160x160>", :tiny => "70x70>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end


