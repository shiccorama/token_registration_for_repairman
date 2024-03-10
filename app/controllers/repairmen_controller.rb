class RepairmenController < ApplicationController
  before_action :set_repairman, only: %i[ show edit update destroy ]

  # generate a unique token for each user.
  require "securerandom"

  # GET /repairmen or /repairmen.json
  def index
    @repairmen = Repairman.all
  end

  # GET /repairmen/1 or /repairmen/1.json
  def show
  end

  # GET /repairmen/new
  def new
    @repairman = Repairman.new
  end

  # GET /repairmen/1/edit
  def edit
  end

  # POST /repairmen or /repairmen.json
  def create
    @repairman = Repairman.new(repairman_params)

    respond_to do |format|
      if @repairman.save
        format.html { redirect_to repairman_url(@repairman), notice: "Repairman was successfully created." }
        format.json { render :show, status: :created, location: @repairman }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @repairman.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /repairmen/1 or /repairmen/1.json
  def update
    respond_to do |format|
      if @repairman.update(repairman_params)
        format.html { redirect_to repairman_url(@repairman), notice: "Repairman was successfully updated." }
        format.json { render :show, status: :ok, location: @repairman }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @repairman.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /repairmen/1 or /repairmen/1.json
  def destroy
    @repairman.destroy!

    respond_to do |format|
      format.html { redirect_to repairmen_url, notice: "Repairman was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_repairman
      @repairman = Repairman.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def repairman_params
      params.require(:repairman).permit(:first_name, :second_name, :email, :location, :password, :password_confirmation, :terms)
    end
end
