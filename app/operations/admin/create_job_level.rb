module Admin
	class CreateJobLevel
		
		def initialize(config:)
			@job_level_name = config[:job_level_name]
			@select_kso = config[:select_kso]
		end

		def execute!
			job_level = JobLevel.new(name: @job_level_name, kso_id: @select_kso)
			job_level.save!
			job_level
		end
	end
end