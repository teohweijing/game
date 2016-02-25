class Account < ActiveRecord::Base
  belongs_to :user
  belongs_to :application

  def application_id_with_username
  	"#{self.application_id} " "-" " #{self.username}"
  end
end
