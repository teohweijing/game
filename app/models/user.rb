class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :role
  has_many :accounts
  has_many :requests
  validates_presence_of :name
  before_save :assign_role

  # # Change url like ".../users/5/accounts/1" to ".../users/Coryn/accounts/1"
  # def to_param
  #   name
  # end

  def assign_role
  	self.role = Role.find_by name: "Regular" if self.role.nil?
  end

  def super_admin?
    self.role.name == "Super Admin"
  end

  def admin?
    self.role.name == "Admin"
  end

  def regular?
    self.role.name == "Regular"
  end 
  
end
