class ListingsController < ApplicationController

	def indexs
		@listing = Listing.new
		@listing.project_id = params[:project_id]
		@listing.skill_id = params[:skill_id]
		@listing.save
		redirect_to edit_project_path(@listing.project_id) 
	end


end
