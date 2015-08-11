class ServiceOrdersController < ApplicationController
  before_action :set_service_order, only: [:show, :edit, :update, :destroy]

  # GET /service_orders
  # GET /service_orders.json
  def index
    #@service_orders = ServiceOrder.all
    @service_join= Citation.joins(:citation_details => :service).joins(:client, :service_order)
    @product_join = ServiceOrder.select("service_orders.id, sum(products.sale_price * ifnull(service_order_details.quantity, 1)) as imp_productos")
    .joins(:service_order_details => :product)
    .group("service_orders.id, products.id").order("service_orders.id asc")
    @service_orders= @service_join.select("clients.name, clients.firstlastname, clients.secondlastname,
    service_orders.id, service_orders.created_at, citations.id as fecha_order, 
    sum(services.price * ifnull(citation_details.quantity, 1)) as imp_servicios")
    .group("clients.name, clients.firstlastname, clients.secondlastname,service_orders.id, service_orders.created_at, citations.id")
    .order("service_orders.id asc")
  end

  # GET /service_orders/1
  # GET /service_orders/1.json
  def show
    @service_order_details = ServiceOrderDetail.where(:service_order_id => params[:id])
    @citation = Citation.where(:id => @service_order.citation_id).select(:id)
    @citation_details = CitationDetail.where(:citation_id => @citation)
  end

  # GET /service_orders/new
  def new
    @service_order = ServiceOrder.new
    @citas_combo =  Citation.all.map{|p| [" Cita Nº " + p.id.to_s + " - "+ p.client_name + " " + p.client_firstlastname,  p.id ] }
    @service_order_details = ServiceOrderDetail.where(:service_order_id => params[:id])
    @products_combo = Product.all.map{|p| [ p.name, p.id ] }
    @contar_products = 0
    @service_details = ServiceDetail.all
    @citation_details = CitationDetail.where(:citation_id => 21)
  end

  # GET /service_orders/1/edit
  def edit
    @citas_combo =  Citation.all.map{|p| [" Cita Nº " + p.id.to_s + " - "+ p.client_name + " " + p.client_firstlastname,  p.id ] }
    @service_order_details = ServiceOrderDetail.where(:service_order_id => params[:id])
    @citation = Citation.where(:id => @service_order.citation_id).select(:id)
    @citation_details = CitationDetail.where(:citation_id => @citation)
    @products_combo = Product.all.map{|p| [ p.name, p.id ] }
    @contar_products = @service_order_details.count

  end

  # POST /service_orders
  # POST /service_orders.json
  def create
    @service_order = ServiceOrder.new(service_order_params)
    @products = params[:inputprod]
    @quantity = params[:inputcantidad]
    #@cita_id = Citation.where(:id => params[:citation_id])
    
    respond_to do |format|
      if @service_order.save
        cont =0
        @products.each do |p|
          detalle = ServiceOrderDetail.new(product_id: p, quantity: @quantity[cont], service_order_id:@service_order.id)
          detalle.save
          cont +=1
        end
        
        format.html { redirect_to @service_order, notice: 'Service order was successfully created.' }
        format.json { render :show, status: :created, location: @service_order }
      else
        format.html { render :new }
        format.json { render json: @service_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /service_orders/1
  # PATCH/PUT /service_orders/1.json
  def update
    @products = params[:inputprod]
    @quantity = params[:inputcantidad]
    
    respond_to do |format|
      if @service_order.update(service_order_params)
        ServiceOrderDetail.delete_all(:service_order_id => params[:id])
        cont =0
        @products.each do |p|
          detalle = ServiceOrderDetail.new(product_id: p, quantity: @quantity[cont], service_order_id:@service_order.id)
          detalle.save
          cont +=1
      end
        
        format.html { redirect_to @service_order, notice: 'Service order was successfully updated.' }
        format.json { render :show, status: :ok, location: @service_order }
      else
        format.html { render :edit }
        format.json { render json: @service_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /service_orders/1
  # DELETE /service_orders/1.json
  def destroy
    @service_order.destroy
    respond_to do |format|
      format.html { redirect_to service_orders_url, notice: 'Service order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service_order
      @service_order = ServiceOrder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_order_params
      params.require(:service_order).permit(:citation_id)
    end
end
