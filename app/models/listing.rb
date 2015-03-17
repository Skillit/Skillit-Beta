class Listing < ActiveRecord::Base
	belongs_to :projects
	belongs_to :users
	belongs_to :skills

end
