class Promotion < ActiveRecord::Base
	belongs_to :application
	has_many :requests

	def application_id_with_description
		if !self.description.blank?
			"#{self.application.name} " "-" " #{self.description}"
		else
			"#{self.application.name}"
		end
	end
end

