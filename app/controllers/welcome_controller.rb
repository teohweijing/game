class WelcomeController < ApplicationController
	# before_action :authenticate_user!, except: [:index]
 	#load_and_authorize_resource
 	before_action :set_user, only: [:show, :account]

	def index
	end

	def show
		@banks = Bank.all
	    @role = current_user.role.name
	    if @role == "Regular"
	      @requests = Request.where(user_id: current_user.id).order("created_at DESC").paginate(per_page: 6, page: params[:page])
      	  @pendings = current_user.requests.where(status: "Pending").limit(5)
	    else
	      @requests = Request.all.order("created_at DESC").paginate(per_page: 6, page: params[:page])
	      @pendings = Request.where(status: "Pending")
	    end
	end

	private
	def set_user
		@user = User.find(current_user)
	end

end