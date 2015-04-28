require 'open-uri' 

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	
	has_many :listings
	has_many :projects, through: :listings
	
	#this may change to incorporate another :through model for user-skills
	has_and_belongs_to_many :skills

	#specify that the avatar is a paperclip file attachment
	#specify additional styles that you want to use in views or eslewhere
	has_attached_file :avatar, :styles => {:thumb => "100x100>"}

	#pull the image from the remote url and assign it as the avatar
	def avatar_from_url(url)
		self.avatar = open(url)
  	end
end


