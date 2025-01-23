module Admin
	class ClustersController < ApplicationController
			before_action :authenticate_user!
		def index
			@clusters = Cluster.select("*")
			@area = Area.select("*")

			@subheader_side_actions = [
	        {
	          id: "btn-new",
	          link: "#",
	          class: "fa fa-plus",
	          text: "New Cluster"
	        }
	      ]
		end

		def show
			
		end
		def create
			cluster_name = params[:cluster_name]
			cluster_shortname = params[:cluster_shortname]
			area_id = params[:selected_area]

			config = {
				cluster_name: cluster_name,
				cluster_shortname: cluster_shortname,
				selected_area: area_id
			}

			errors = ::Admin::ValidateCreateCluster.new(config: config).execute!
			if errors[:full_messages].any?
				render json: errors, status: 400
			else
				cluster = ::Admin::CreateCluster.new(config: config).execute!
				render json: {message: "success"}
			end


		end
	end
end