class UsersController < ApplicationController

	before_action :authenticate_user!
	
	#This action will direct to the index view that may show a list of all users
	def index
		@user = User.all
	end

	#This will lead to the view for a single users page (VERY IMPORTANT)
	def show
		#@user = User.find(params[:id])
		@user = User.find(current_user)
		@talents = Skill.joins('LEFT OUTER JOIN talents ON talents.skill_id = skills.id').where("user_id = ?", current_user.id)

	end

	#defines user_params which will be passed back and forth. Has parameters, name, about and email so far.
	private
		def user_params
			params.require(:user).permit(:name,:about,:email)
		end
end