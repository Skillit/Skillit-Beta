class UsersController < ApplicationController

	before_action :authenticate_user!

	#test
	#This action will direct to the index view that may show a list of all users
	def index
		@user = User.all
	end

	#This will lead to the view for a single users page (VERY IMPORTANT)
	def show
		@user = User.find(params[:id])
	end

	#This will lead to the view for the Sign Up page
	def new
		@user = User.new
	end

	#This action will be performed when the user hits submit at the end of Sign up. No view to go with.
	def create
		@user = User.new(user_params)

		if @user.save
			redirect_to @user
		else
			render 'new'
		end
	end

	#This will lead to the slightly altered show/new page of the logged in user. Filled from data passed in.
	def edit
		@user = User.find(params[:id])
	end

	#update is to edit, what create was for new. Run after edit. No view
	def update
		@user = User.find(params[:id])

		if @user.update(user_params)
			redirect_to @user
		else
			render 'edit'
		end
	end

	#This action runs if user wants to delete their account. 
	def destroy
	end

	#defines user_params which will be passed back and forth. Has parameters, name, about and email so far.
	private
		def user_params
			params.require(:user).permit(:name,:about,:email)
		end


end
