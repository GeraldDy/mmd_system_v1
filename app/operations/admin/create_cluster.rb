module Admin
	class CreateCluster
		def initialize(config:)
			@cluster_name 					= config[:cluster_name]
			@cluster_shortname = config[:cluster_shortname]
			@area_id 										= config[:selected_area]
		end

		def execute!
			@cluster = Cluster.new(name: @cluster_name, short_name: @cluster_shortname,area_id: @area_id)
			@cluster.save!
			@cluster
		end
	end
end