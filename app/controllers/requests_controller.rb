class RequestsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  # GET /requests
  # GET /requests.json
  def index
    @role = current_user.role.name
    if @role == "Regular"
      @requests = Request.where(user_id: current_user.id)
      @pendings = current_user.requests.where(status: "Pending").limit(5)
    else
      @requests = Request.all
      @pendings = Request.where(status: "Pending")
    end
  end

  # GET /requests/1
  # GET /requests/1.json
  def show
  end

  # GET /requests/new
  def new
    @request = Request.new
    if params[:category]
      @request.category = params[:category]
    else
      redirect_to root_url
    end
  end

  # GET /requests/1/edit
  def edit
  end

  # POST /requests
  # POST /requests.json
  def create
    @request.user_id = current_user.id

    respond_to do |format|
      if @request.save
        format.html { redirect_to @request, notice: 'Request was successfully created.' }
        format.json { render :show, status: :created, location: @request }
      else
        format.html { render :new }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requests/1
  # PATCH/PUT /requests/1.json
  def update
    @request = Request.find(params[:id])
    
    if @request.approved_by.nil?
      @request.approved_by = current_user.name
      @request.save
      respond_to do |format|
        if @request.update(request_params)
          format.html { redirect_to @request, notice: 'Request was successfully updated.' }
          format.json { render :show, status: :ok, location: @request }
        else
          format.html { render :edit }
          format.json { render json: @request.errors, status: :unprocessable_entity }
        end
      end

    else
      respond_to do |format|
        format.html { redirect_to @request, notice: 'Request has already been processed' }
        format.json { render :show, status: :ok, location: @request}
      end
    end

  end

  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    @request.image = nil
    @request.destroy
    respond_to do |format|
      format.html { redirect_to requests_url, notice: 'Request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def detect_changes
      @changed = []
      @changed << :approved_by if @request.approved_by != params[:request][:approved_by]
    end

    def attr_changed?
      @changed.include :approved_by
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # category: Withdrawal, Deposit, Transfer
    # status: Pending, Approve, Reject
    # description: Data and Time of bank-in statement
    # game_name_2: for Transfer purpose
    # reason: for Reject purpose
    # approved_by: for recording Admin log
    def request_params
      params.require(:request).permit(:category, 
                                      :game_name, 
                                      :bank_name, 
                                      :bank_acc, 
                                      :amount, 
                                      :user_id, 
                                      :status, 
                                      :image, 
                                      :description, 
                                      :game_name_2, 
                                      :reason,
                                      :approved_by)
    end
end
