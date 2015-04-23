class TalentsController < ApplicationController

	def index
		@talent = Talent.new
		@talent.user_id = params[:user_id]
		@talent.skill_id = params[:skill_id]
		@talent.save
		redirect_to edit_user_registration_path(@talent.user_id)
	end

end
