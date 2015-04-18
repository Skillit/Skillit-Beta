class HomeController < ApplicationController
	def index
		@project = Project.all
		#landing page redirection code goes here
	end

	def landing
		render "landingpg"
	end
end
