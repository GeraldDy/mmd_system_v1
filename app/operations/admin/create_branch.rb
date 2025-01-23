module Admin
	class CreateBranch
		def initialize(config:)
			@branch_name = config[:branch_name]
			@branch_shortname = config[:branch_shortname]
			@cluster_id = config[:cluster_id]
		end
		
		def execute!
				@branch = Branch.new(name: @branch_name,short_name: @branch_shortname, cluster_id: @cluster_id)
				@branch.save!
				@branch
		end
	end
end