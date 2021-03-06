class UsersController < ApplicationController

	before_action :authenticate_user!
	
	#This action will direct to the index view that may show a list of all users
	def index
		@user = User.all

	end

	def show
		@user = User.find(params[:id])
		#@user = User.find(current_user)
		@talents = Skill.joins('LEFT OUTER JOIN talents ON talents.skill_id = skills.id').where("user_id = ?", params[:id])
		@projects = Project.joins(:listings).where("user_id = ?", params[:id])
	end

	def create
	  	#create the user from specified user parameters
	    @user = User.new(user_params)
	    
	    #pull the image from the specified url and set the user's avatar
	    @user.avatar_from_url(params[:avatar_url])
	end

	#defines user_params which will be passed back and forth. Has parameters, name, about and email so far.
	private
		def user_params
			params.require(:user).permit(:name,:about,:email)
		end
end