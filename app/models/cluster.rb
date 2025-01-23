class Cluster < ApplicationRecord
	belongs_to :area
	has_many :branches, dependent: :delete_all


end
