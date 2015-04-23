class ProjectsController < ApplicationController

	#This action will direct to the index view that may show a list of all projects. May also be run in the homepage
	def index
		@project = Project.all
	end

	#This will lead to the view for a single project's page (VERY IMPORTANT)
	def show
		@project = Project.find(params[:id])
	end

	#This will lead to the view for the New project page
	def new
		@project = Project.new
		@skill = Skill.all
	end

	#This action will be performed when the user hits submit at New project. No view to go with.
	def create
		@project = Project.new(project_params)

		if @project.save
			redirect_to @project
		else
			render 'new'
		end
	end

	#This will lead to the slightly altered show/new page of the project. Filled from data passed in.
	def edit
		@project = Project.find(params[:id])
		@skill = Skill.all

		@projlistings = Listing.where("project_id = ?", params[:id])
		#	@projlistings
		#else

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
