class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy]

  # GET /services
  # GET /services.json
  def index
    @services = Service.all
  end

  # GET /services/1
  # GET /services/1.json
  def show
    @service_details = ServiceDetail.where(:service_id => params[:id])
  end

  # GET /services/new
  def new
    @service = Service.new
    @product = Product.all.map{|p| [ p.name, p.id ]} 
    @service_details = ServiceDetail.all
    @contar_products = 0
  end

  # GET /services/1/edit
  def edit
    @product = Product.all.map{|p| [ p.name, p.id ]} 
    @service_details = ServiceDetail.where(:service_id => params[:id])
    @servicio = Service.where(:service_id => params[:id])
    @contar_products = @service_details.count
    @lista_productos = Product.joins(:services)
    @productos = params[:inputprod]
  end

  # POST /services
  # POST /services.json
  def create
    @productos = params[:inputprod]
    @service = Service.new(service_params)

    respond_to do |format|
      if @service.save
        
        @productos.each do |p|
          detalle = ServiceDetail.new(product_id: p, service_id:@service.id)
          detalle.save
        end
        format.html { redirect_to @service, notice: 'Service was successfully created.' }
        format.json { render :show, status: :created, location: @service }
      else
        @product = Product.all.map{|p| [ p.name, p.id ]} 
        format.html { render :new }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /services/1
  # PATCH/PUT /services/1.json
  def update
    @service_details = ServiceDetail.where(:service_id => params[:id])
    @productos = params[:inputprod]
    
    respond_to do |format|
      if @service.update(service_params)
        ServiceDetail.delete_all(:service_id => params[:id])
        
        @productos.each do |p|
          detalle = ServiceDetail.new(product_id: p, service_id:@service.id)
          detalle.save
        end
        format.html { redirect_to @service, notice: 'Service was successfully updated.' }
        format.json { render :show, status: :ok, location: @service }
      else
        @product = Product.all.map{|p| [ p.name, p.id ]} 
        format.html { render :edit }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /services/1
  # DELETE /services/1.json
  def destroy
    ServiceDetail.delete_all(:service_id => params[:id])
    @service.destroy
    respond_to do |format|
      format.html { redirect_to services_url, notice: 'Service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_params
      params.require(:service).permit(:name, :price, :price, :observation, :citation_id, :product_id)
    end
    
    def delete_details
      @service_details = ServiceDetail.where(:service_id => params[:id])
      @productos = params[:inputprod]
      @service = Service.update(service_params)
      
      @service_details.destroy

      @productos.each do |p|
          detalle = ServiceDetail.new(product_id: p, service_id:@service.id)
          detalle.save
      end
    end
    
end
