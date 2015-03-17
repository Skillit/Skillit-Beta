class Skill < ActiveRecord::Base
	has_many :listings
	has_many :projects, through: :listings

	#this may change to incorporate another :through model for user-skills
	has_and_belongs_to_many :users
end
