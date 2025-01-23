module Admin
	class JobLevelsController < ApplicationController
		before_action :authenticate_user!
	
	def index
		@job_levels = JobLevel.select("*")
		@kso_settings = Settings[:kso_org]
		@subheader_side_actions = [
	        {
	          id: "btn-new",
	          link: "#",
	          class: "fa fa-plus",
	          text: "Create Job Level"
	        }
	      ]
	end

	def create
		job_level_name = params[:job_level_name]
		select_kso = params[:select_kso]

		config = {
			job_level_name: job_level_name,
			select_kso: select_kso
		}

		errors = ::Admin::ValidateCreateJobLevel.new(config: config).execute!

		if errors[:full_messages].any?
			render json: errors, status: 400
		else
			job_level = ::Admin::CreateJobLevel.new(config: config).execute!
			render json: {message: "Success"}
		end

	end


	end
end