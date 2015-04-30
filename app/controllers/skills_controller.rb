class SkillsController < ApplicationController
	
	def index
		@skill = Skill.new(params[:search])
	end

	def userlink
	end

	def projlink
		@skill = Skill.find(params[:id])

		redirect_to edit_user_path(params[@skill.id])
	end

	def show
		
	end

	#Run when user enters a skill that is not in the db. No view. Done autonatically (somehow)
	def new
		@skill = Skill.new
	end

	def create
		@skill = Skill.new(project_params)
	end

	#for admin cleanup only
	def edit
	end

	def update
	end

	#for admin cleanup only
	def destroy
	end
end
