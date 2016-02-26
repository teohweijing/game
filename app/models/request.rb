class Request < ActiveRecord::Base
  belongs_to :user
  belongs_to :promotion
  before_save :assign_status
  # validate :validate_approved_by
  
  # Image upload system, change the resolution of 'medium' for preview
  has_attached_file :image, 
                    styles: { medium: "300x300>", thumb: "100x100>" }, 
                    url: "/system/:hash.:extension", 
                    hash_secret: "abc123"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates_attachment_size :image, less_than: 5.megabytes

  #validates_attachment :image, presence: true, 
  #content_type: { content_type: ["image/jpeg", "image/gif", "image/png", "image/jpg"] }, 
  #size: { less_than: 10.megabytes }
  
  # def validate_approved_by
  #   if self.approved_by != current_user.name
  #     errors.add(:approved_by, "Edited by another admin")
  #   end
  # end

  def assign_status
  	self.status = "Pending" if self.status.nil?
  end
end
