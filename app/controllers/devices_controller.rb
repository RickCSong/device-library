class DevicesController < ApplicationController
  before_action :set_device, only: [:show, :update, :destroy]
  before_action :require_admin_permission, only: [:create, :update, :destroy]
  before_action :require_terminal_permission, only: [:checkout, :return]

  # GET /devices.json
  def index
    @devices = params[:ids] ? Device.where(id: params[:ids]) : Device.all

    respond_to do |format|
      format.json
    end
  end

  # GET /devices/1.json
  def show
    respond_to do |format|
      format.json
    end
  end

  # POST /devices
  # POST /devices.json
  def create
    @device = Device.new(device_params)

    respond_to do |format|
      if @device.save
        format.json { render 'show', status: :created }
      else
        format.json { render json: {errors: @device.errors}, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /devices/1
  # PATCH/PUT /devices/1.json
  def update
    respond_to do |format|
      if @device.update(device_params)
        format.json { head :no_content }
      else
        format.json { render json: {errors: @device.errors}, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /devices/1
  # DELETE /devices/1.json
  def destroy
    @device.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  # POST /devices/checkout
  def checkout

  end

  # POST /devices/return
  def return

  end

  private

  def set_device
    @device = Device.find(params[:id])
  end

  def device_params
    params.require(:device).permit(:hardware,
                                   :operating_system,
                                   :storage_code,
                                   :barcode,
                                   :status,
                                   :details,
                                   :user_id,
                                   :category_id)
  end

  def checkout_params

  end

  def return_params

  end
end
