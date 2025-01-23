module Admin
	class ValidateCreateCluster < AppValidator

		def initialize(config:)
			super()
			@cluster_name = config[:cluster_name]
			@cluster_shortname = config[:cluster_shortname]
			@area_id = config[:selected_area]
			@cluster = Cluster.where(name: @cluster_name)
		end

		def execute!
		
			if @cluster_name.blank?
				@errors[:messages] << {
				 key: "cluster name",
				 message: "cluster name cannot be blank"
				}
			end

			if @cluster_shortname.blank?
				@errors[:messages] << {
				 key: "cluster shortname",
				 message: "cluster shortname cannot be blank"
				}
			end

			if @area_id.blank?
				@errors[:messages] << {
				 key: "area",
				 message: "area cannot be blank"
				}
			end

			if @cluster.any?
				@errors[:messages] << {
				 key: "cluster",
				 message: "cluster name has been taken"
				}
			end
			


				@errors[:messages].each do |e|
					@errors[:full_messages] << e[:message]
				end
			@errors
			
		end
	


	end
end