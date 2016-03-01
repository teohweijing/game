class Account < ActiveRecord::Base
  belongs_to :user
  belongs_to :application

  def application_id_with_username
  	"#{self.application.name} " "-" " #{self.username}"
  end
end
