class TalentsController < ApplicationController

	def index
		@talent = Talent.new
		@talent.project_id = params[:project_id]
		@talent.skill_id = params[:skill_id]
		@talent.save
		redirect_to edit_project_path(@talent.project_id)
	end

end
