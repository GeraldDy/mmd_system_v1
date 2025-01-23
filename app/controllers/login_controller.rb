class LoginController < ApplicationController
	def user_login
		username = params[:username]
		password = params[:password]
		
		config = {
			username: username,
			password: password
		}
		
		errors = ::Users::ValidateLogin.new(config: config)
		errors.execute!

		if errors.errors.any?
		 render json: errors,status: 400
		else
			sign_in(:user, errors.user)
			
		 render json: {user: errors.user.user_object}
		end

	end
end