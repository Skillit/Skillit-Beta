class ProjectsController < ApplicationController

	#This action will direct to the index view that may show a list of all projects. May also be run in the homepage
	def index
		@project = Project.all
	end

	#This will lead to the view for a single project's page (VERY IMPORTANT)
	def show
		@project = Project.find(params[:id])

		@skilllistings = Skill.joins(:listings).where("project_id = ?", params[:id])
		@listings = Listing.joins("LEFT OUTER JOIN skills ON skill_id = skills.id").where("project_id = ?", params[:id])
		#@listings = Listing.joins(:skills).where("project_id = ?", params[:id])

		@author = User.joins("LEFT OUTER JOIN projects ON projects.author_id = users.id").where("users.id = ? ", @project.author_id)
		@contributors = User.joins(:listings).where("project_id = ?", params[:id])

	end

	#This will lead to the view for the New project page
	def new
		@project = Project.new
		@skill = Skill.all
	end

	#This action will be performed when the user hits submit at New project. No view to go with.
	def create
		@project = Project.new(project_params)
		@project.author_id = current_user.id
		@project.status = true

		if @project.save

			redirect_to edit_project_path(@project)
			#redirect_to listings_path(project_id: @project.id, user_id: current_user.id)
		else
			render 'new'
		end
	end

	#This will lead to the slightly altered show/new page of the project. Filled from data passed in.
	def edit
		@project = Project.find(params[:id])
		@skill = Skill.all

		#@listings = Listing.where("project_id = ?", params[:id])
		#@listings = Skill.joins('LEFT OUTER JOIN listings ON listings.skill_id = skills.id').where("project_id = ?", params[:id])

		@listings = Skill.joins(:listings).where("project_id = ?", params[:id])

		#@author = User.joins('LEFT OUTER JOIN listings ON listings.user_id = users.id').where("project_id = ?", params[:id])
		#@contributors = User.joins(:listings).where("project_id = ?", params [:id])


		#end

	end

	#update is to edit, what create was for new. Run after edit. No view
	def update
		@project = Project.find(params[:id])

		if @project.update(project_params)
			redirect_to @project
		else
			render 'edit'
		end
	end

	#This action runs if user wants to delete their project. 
	def destroy
	end

	#defines project_params which will be passed back and forth. Has parameters, name, about and email so far.
	private
		def project_params
			params.require(:project).permit(:name,:description,:status)
		end

end
