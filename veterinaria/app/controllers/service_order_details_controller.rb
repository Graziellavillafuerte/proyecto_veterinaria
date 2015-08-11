class ServiceOrderDetailsController < ApplicationController
  before_action :set_service_order_detail, only: [:show, :edit, :update, :destroy]

  # GET /service_order_details
  # GET /service_order_details.json
  def index
    @service_order_details = ServiceOrderDetail.all
  end

  # GET /service_order_details/1
  # GET /service_order_details/1.json
  def show
  end

  # GET /service_order_details/new
  def new
    @service_order_detail = ServiceOrderDetail.new
  end

  # GET /service_order_details/1/edit
  def edit
  end

  # POST /service_order_details
  # POST /service_order_details.json
  def create
    @service_order_detail = ServiceOrderDetail.new(service_order_detail_params)

    respond_to do |format|
      if @service_order_detail.save
        format.html { redirect_to @service_order_detail, notice: 'Service order detail was successfully created.' }
        format.json { render :show, status: :created, location: @service_order_detail }
      else
        format.html { render :new }
        format.json { render json: @service_order_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /service_order_details/1
  # PATCH/PUT /service_order_details/1.json
  def update
    respond_to do |format|
      if @service_order_detail.update(service_order_detail_params)
        format.html { redirect_to @service_order_detail, notice: 'Service order detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @service_order_detail }
      else
        format.html { render :edit }
        format.json { render json: @service_order_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /service_order_details/1
  # DELETE /service_order_details/1.json
  def destroy
    @service_order_detail.destroy
    respond_to do |format|
      format.html { redirect_to service_order_details_url, notice: 'Service order detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service_order_detail
      @service_order_detail = ServiceOrderDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_order_detail_params
      params.require(:service_order_detail).permit(:quantity, :service_order_id, :product_id)
    end
end
