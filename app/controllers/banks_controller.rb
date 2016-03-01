class BanksController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  # GET /banks
  # GET /banks.json
  def index
  end

  # GET /banks/1
  # GET /banks/1.json
  def show
  end

  # GET /banks/new
  def new
  end

  # GET /banks/1/edit
  def edit
  end

  # POST /banks
  # POST /banks.json
  def create
    respond_to do |format|
      if @bank.save
        format.html { redirect_to @bank, notice: 'Bank was successfully created.' }
        format.json { render :show, status: :created, location: @bank }
      else
        format.html { render :new }
        format.json { render json: @bank.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /banks/1
  # PATCH/PUT /banks/1.json
  def update
    respond_to do |format|
      if @bank.update(bank_params)
        format.html { redirect_to @bank, notice: 'Bank was successfully updated.' }
        format.json { render :show, status: :ok, location: @bank }
      else
        format.html { render :edit }
        format.json { render json: @bank.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /banks/1
  # DELETE /banks/1.json
  def destroy
    @bank.destroy
    respond_to do |format|
      format.html { redirect_to banks_url, notice: 'Bank was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def bank_params
      params.require(:bank).permit(:name, :acc, :status, :holder_name)
    end
end
