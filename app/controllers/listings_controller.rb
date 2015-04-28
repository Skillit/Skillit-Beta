class ListingsController < ApplicationController

	def index
		@listing = Listing.new
		@listing.project_id = params[:project_id]
		@listing.skill_id = params[:skill_id]
		@listing.user_id = params[:user_id]
		@listing.save
		redirect_to edit_project_path(@listing.project_id) 
	end

	def edit 
		@userAdd = Listing.find(params[:listing_id])
		@userAdd.user_id = current_user.id
		@userAdd.save

		redirect_to project_path(params[:id])

	end


end
