class AccountsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  # GET /accounts
  # GET /accounts.json
  def index
    user = User.find(params[:user_id]) 
    @accounts = user.accounts
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show
    user = User.find(params[:user_id])
  end

  # GET /accounts/new
  def new
    user = User.find(params[:user_id])
    @account = user.accounts.build
  end

  # GET /accounts/1/edit
  def edit
    user = User.find(params[:user_id])
  end

  # POST /accounts
  # POST /accounts.json
  def create
    user = User.find(params[:user_id])
    @account = user.accounts.create(account_params)

    respond_to do |format|
      if @account.save
        format.html { redirect_to([@account.user, @account], notice: 'Account was successfully created.')}
        format.json { render :show, status: :created, location: @account }
      else
        format.html { render :new }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accounts/1
  # PATCH/PUT /accounts/1.json
  def update
    user = User.find(params[:user_id])
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to([@account.user, @account], notice: 'Account was successfully updated.')}
        format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    user = User.find(params[:user_id])
    @account.destroy
    respond_to do |format|
      format.html { redirect_to user_accounts_url, notice: 'Account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def account_params
      params.require(:account).permit(:username, :password, :user_id, :application_id)
    end
end
