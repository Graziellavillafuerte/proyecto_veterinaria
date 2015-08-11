class CitationsController < ApplicationController
  before_action :set_citation, only: [:show, :edit, :update, :destroy, :update_state]

  # GET /citations
  # GET /citations.json
  def index
    @citations = Citation.where(:state => 1).order(time: :asc)
    #@estado = params[:estado]
    #@citations_lista = Citation.where(:state => @estado)
    @estado_cita = 1..3 
    @citations_lista = Citation.all.where(:state => @estado_cita)
    #@citations_lista = Citation.all
    @date = params[:month] ? Date.parse(params[:month]) : Date.today
    

  end

  # GET /citations/1
  # GET /citations/1.json
  def show
    @citation_details = CitationDetail.where(:citation_id => params[:id])
    @clients = Client.all.map{|p| [ (p.name + " " + p.firstlastname + " " + p.secondlastname), p.id ] }
    
    
    respond_to do |format|
      #NotifyMailer.notify_mail(@client, @client_name).deliver
      format.html
      format.pdf do
	    pdf = CitationPdf.new(@citation, view_context)
	    send_data pdf.render, filename: "citation_#{Time.now.strftime("%d/%m/%Y")}.pdf", type: "application/pdf"
end
    end
  end

  # GET /citations/new
  def new
    @citation = Citation.new
    @clients = Client.all.map{|p| [ (p.name + " " + p.firstlastname + " " + p.secondlastname), p.id ] }
    @services_combo = Service.all.map{|p| [ p.name, p.id ] }
    @citation_details = CitationDetail.all
    @contar_services = 0
  end

  # GET /citations/1/edit
  def edit
    @services_combo = Service.all.map{|p| [ p.name, p.id ] }
    @clients = Client.all.map{|p| [ (p.name + " " + p.firstlastname + " " + p.secondlastname), p.id ] }
    @citation_details = CitationDetail.where(:citation_id => params[:id])
    #@citation = Citation.where(:citation_id => params[:id])
    @contar_services = @citation_details.count
  end

  # POST /citations
  # POST /citations.json
  def create
    @services = params[:inputserv]#[:inputcantidad]
    @quantity = params[:inputcantidad]
    @citation = Citation.new(citation_params)
    @client = Client.where(:id => @citation.client_id).select(:email)
    @client_name = Client.where(:id => @citation.client_id).select(:name, :firstlastname)

    respond_to do |format|
      if @citation.save
        cont = 0
        @services.each do |p|
          detalle = CitationDetail.new(service_id: p, quantity: @quantity[cont], citation_id:@citation.id)
          detalle.save
          cont +=1
        end
        #NotifyMailer.notify_mail(@citation).deliver
        
        format.html { redirect_to @citation, notice: 'Citation was successfully created.' }
        format.json { render :show, status: :created, location: @citation }
      else
        @clients = Client.all.map{|p| [ p.name, p.id ] }
        @services_combo = Service.all.map{|p| [ p.name, p.id ] }
        @citation_details = CitationDetail.where(:service_id => params[:id])
        #@services = params[:inputserv][:inputcantidad]
        format.html { render :new }
        format.json { render json: @citation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /citations/1
  # PATCH/PUT /citations/1.json
  def update
    @citation_details = CitationDetail.where(:citation_id => params[:id])
    @services = params[:inputserv]
    @quantity = params[:inputcantidad]
    
    respond_to do |format|
      if @citation.update(citation_params)
        CitationDetail.delete_all(:citation_id => params[:id])
        cont = 0
        @services.each do |p|
          detalle = CitationDetail.new(service_id: p, quantity: @quantity[cont], citation_id:@citation.id)
          detalle.save
          cont +=1
        end
        
        format.html { redirect_to @citation, notice: 'Citation was successfully updated.' }
        format.json { render :show, status: :ok, location: @citation }
      else
        format.html { render :edit }
        format.json { render json: @citation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /citations/1
  # DELETE /citations/1.json
  def destroy
    CitationDetail.delete_all(:citation_id => params[:id])
    @citation.destroy
    respond_to do |format|
      format.html { redirect_to citations_url, notice: 'Citation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # UPDATE /citations/1
  def update_state
    Citation.update(params[:id], :state => 3)
    respond_to do |format|
      format.html { redirect_to citations_url, notice: 'Citation was successfully updated.' }
      format.json { head :no_content }
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_citation
      @citation = Citation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def citation_params
      params.require(:citation).permit(:date, :time, :observation, :quantity, :state, :service_id, :client_id)
    end
end
