module Admin
	class AreasController < ApplicationController
		before_action :authenticate_user!
		def index
			@areas = Area.select("*")

			@subheader_side_actions = [
	        {
	          id: "btn-new",
	          link: "#",
	          class: "fa fa-plus",
	          text: "New Area"
	        }
	      ]
		end


		def create
			@area_name = params[:area_name]
			@area_shortname = params[:area_shortname]
			config = {
			area_name: @area_name,
			area_shortname: @area_shortname
			}
			errors = ::Admin::ValidateCreateArea.new(config: config).execute!

			if errors[:full_messages].any?
				  render json: errors, status: 400
			else
				area = ::Admin::CreateArea.new(config: config).execute!
				render json: {message: "success"}
			end


		end
	end
end