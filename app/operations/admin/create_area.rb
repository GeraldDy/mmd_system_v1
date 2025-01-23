module Admin
	class CreateArea
		def initialize(config:)
			@area_name = config[:area_name]
			@area_shortname = config[:area_shortname]
		end
		
		def execute!
			@area = Area.new(name: @area_name,short_name: @area_shortname)
			@area.save!
			@area
		end
	end
end