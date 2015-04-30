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
	has_attached_file :avatar, :styles => {
		:medium => "200x200>",
		:small => "150x150#",
		:thumb => "100x100",
		:default_url => "/assets/images/missing.png"
	}

  	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  	def self.search(search)
		if search
			where("first_name LIKE ?", "%#{search}%")
		else
			all
		end
	end

end


