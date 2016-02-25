class Application < ActiveRecord::Base
	has_many :accounts
	has_many :promotions

	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

end
