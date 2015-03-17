class Project < ActiveRecord::Base
	has_many :listings
	has_many :skills, :through => :listings
	has_many :users, :through => :listings
	
end
