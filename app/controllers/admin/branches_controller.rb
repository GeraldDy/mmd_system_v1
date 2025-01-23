module Admin
	class BranchesController < ApplicationController
		before_action :authenticate_user!
		
		def index
			@branch = Branch.select("*")
			@clusters = Cluster.select("*")

			@subheader_side_actions = [
	        {
	          id: "btn-new",
	          link: "#",
	          class: "fa fa-plus",
	          text: "New Branch"
	        }
	      ]
		end

		def create
			branch_name = params[:branch_name]
			branch_shortname = params[:branch_shortname]
			cluster_id = params[:selected_cluster]

			config = {
				branch_name: branch_name,
				branch_shortname: branch_shortname,
				cluster_id: cluster_id
			}

			errors = ::Admin::ValidateCreateBranch.new(config: config).execute!

			if errors[:full_messages].any?
				render json: errors, status: 400
			else
				branch = ::Admin::CreateBranch.new(config: config).execute!
				render json: {message: "success"}
			end


		end
	
	end
end