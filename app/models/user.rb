class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :listings
	has_many :projects, through: :listings
	
	#this may change to incorporate another :through model for user-skills
	has_and_belongs_to_many :skills
end
