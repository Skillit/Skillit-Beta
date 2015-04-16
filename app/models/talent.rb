class Talent < ActiveRecord::Base
	belongs_to :users
	belongs_to :skills

end
