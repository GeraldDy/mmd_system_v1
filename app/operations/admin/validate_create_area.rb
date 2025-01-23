module Admin
	class ValidateCreateArea < AppValidator
		def initialize(config:)
			super()
			@area_name = config[:area_name]
			@area_shortname = config[:area_shortname]
			@area = Area.where(name: @area_name)
		end

		def execute!
			if @area_name.blank?
				@errors[:messages] << {
				 key: "area name",
				 message: "area name cannot be blank"
				}
			end

			if @area_shortname.blank?
				@errors[:messages] << {
				 key: "area shortname",
				 message: "area shortname cannot be blank"
				}
			end

			if @area.any?
				@errors[:messages] << {
				 key: "duplicate area",
				 message: "area name has been taken"
				}
			end

			@errors[:messages].each do |e|
				@errors[:full_messages] << e[:message]
			end
			@errors

		end
	end
end