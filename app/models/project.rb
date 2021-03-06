class Project < ActiveRecord::Base
	has_many :listings
	has_many :skills, :through => :listings
	has_many :users, :through => :listings
	
	def self.search(search)
		if search
			where("name LIKE ?", "%#{search}%")
		else
			all
		end
	end


end
