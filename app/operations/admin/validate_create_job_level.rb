module Admin
	class ValidateCreateJobLevel < AppValidator
		def initialize(config:)
			super()
			@job_level_name = config[:job_level_name]
			@select_kso = config[:select_kso]
			@job_level = JobLevel.where(name: @job_level_name, kso_id: @select_kso)
		end

		def execute!
			if @job_level_name.blank?
				@errors[:messages] << {
					key: "job level name",
					message: "Job Level name cannot be blank"
				}
			end

			if @job_level.present?
				@errors[:messages] << {
					key: "job level",
					message: "duplicate"
				}
			end

			@errors[:messages].each do |e|
				@errors[:full_messages] << e[:message]
			end
			@errors
		end

	end
end