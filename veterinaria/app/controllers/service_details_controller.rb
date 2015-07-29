class ServiceDetailsController < ApplicationController
  before_action :set_service_detail, only: [:show, :edit, :update, :destroy]

  # GET /service_details
  # GET /service_details.json
  def index
    @service_details = ServiceDetail.all
  end

  # GET /service_details/1
  # GET /service_details/1.json
  def show
  end

  # GET /service_details/new
  def new
    @service_detail = ServiceDetail.new
    @service_details = ServiceDetail.all
  end

  # GET /service_details/1/edit
  def edit
  end

  # POST /service_details
  # POST /service_details.json
  def create
    @service_detail = ServiceDetail.new(service_detail_params)

    respond_to do |format|
      if @service_detail.save
        format.html { redirect_to @service_detail, notice: 'Service detail was successfully created.' }
        format.json { render :show, status: :created, location: @service_detail }
      else
        format.html { render :new }
        format.json { render json: @service_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /service_details/1
  # PATCH/PUT /service_details/1.json
  def update
    respond_to do |format|
      if @service_detail.update(service_detail_params)
        format.html { redirect_to @service_detail, notice: 'Service detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @service_detail }
      else
        format.html { render :edit }
        format.json { render json: @service_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /service_details/1
  # DELETE /service_details/1.json
  def destroy
    @service_detail.destroy
    respond_to do |format|
      format.html { redirect_to service_details_url, notice: 'Service detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service_detail
      @service_detail = ServiceDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_detail_params
      params.require(:service_detail).permit(:quantity, :product_id, :service_id)
    end
end
