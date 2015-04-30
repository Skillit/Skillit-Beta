class HomeController < ApplicationController
	def index
		@project = Project.all
		@search
		#@project = Project.order("created_at DESC") #ADD Created_at to projects
		#landing page redirection code goes here

		#@project = Project.search(params[:search])
	end

	def landing
		render "landingpg"
	end

	def search
		@project = Project.search(params[:search])

	end
end
