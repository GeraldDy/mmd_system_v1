module Admin
	class EmployeesController < ApplicationController
		def index
			@employees = Employee.select("*")
		end
	end
end