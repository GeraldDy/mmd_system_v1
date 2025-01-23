class Area < ApplicationRecord

	has_many :clusters , dependent: :delete_all
end
