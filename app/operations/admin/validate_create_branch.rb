module Admin
	class ValidateCreateBranch< AppValidator
		def initialize(config:)
			super()
			@branch_name = config[:branch_name]
			@branch_shortname = config[:branch_shortname]
			@cluster_id = config[:cluster_id]
			@branch = Branch.where(name: @branch_name)
		end

		def execute!

			if @branch_name.blank?
				@errors[:messages] << {
					key: "branch name",
					message: "branch name cannot be blank"
				}
			end

			if @branch_shortname.blank?
				@errors[:messages] << {
					key: "branch shortname",
					message: "branch shortname cannot be blank"
				}
			end


			if @cluster_id.blank?
				@errors[:messages] << {
					key: "cluster",
					message: "cluster cannot be blank"
				}
			end

			if @branch.any?
				@errors[:messages] << {
					key: "branch",
					message: "branch name has been taken"
				}
			end


			@errors[:messages].each do |e|
				@errors[:full_messages] << e[:message]
			end
			@errors

		end
	end
end