class PagesController < ApplicationController
	before_action :authenticate_user!, except: [:login, :forgot_password, :ping]
	def index
		
	end
	def login
		 render 'pages/login', layout: 'landing'
	end



end
