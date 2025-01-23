class Branch < ApplicationRecord
	belongs_to :cluster
	has_many :employees
end
