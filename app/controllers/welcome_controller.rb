class WelcomeController < ApplicationController
	# before_action :authenticate_user!, except: [:index]
 	#load_and_authorize_resource
 	before_action :set_user, only: [:show, :account]

	def index
	end

	def show
		@banks = Bank.all
	end

	private
	def set_user
		@user = User.find(current_user)
	end

end