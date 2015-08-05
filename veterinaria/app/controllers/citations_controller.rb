class CitationsController < ApplicationController
  before_action :set_citation, only: [:show, :edit, :update, :destroy]

  # GET /citations
  # GET /citations.json
  def index
    @citations = Citation.all
  end

  # GET /citations/1
  # GET /citations/1.json
  def show
    @citation_details = CitationDetail.where(:citation_id => params[:id])
  end

  # GET /citations/new
  def new
    @citation = Citation.new
    @clients = Client.all.map{|p| [ p.name, p.id ] }
    @services_combo = Service.all.map{|p| [ p.name, p.id ] }
    @contar_services = 0
  end

  # GET /citations/1/edit
  def edit
    @services = Service.all.map{|p| [ p.name, p.id ]}
    @citation_details_id = CitationDetail.where(:service_id => params[:id])
    #@citation = Citation.where(:citation_id => params[:id])
    @contar_services = @citation_details_id.count
  end

  # POST /citations
  # POST /citations.json
  def create
    @services = params[:inputserv]
    @citation = Citation.new(citation_params)

    respond_to do |format|
      if @citation.save
        @services.each do |p|
          detalle = CitationDetail.new(service_id: p, citation_id:@citation.id)
          detalle.save
        end
        
        format.html { redirect_to @citation, notice: 'Citation was successfully created.' }
        format.json { render :show, status: :created, location: @citation }
      else
        format.html { render :new }
        format.json { render json: @citation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /citations/1
  # PATCH/PUT /citations/1.json
  def update
    @citation_details = CitationDetail.where(:citation_id => params[:id])
    @services = params[:inputprod]
    
    respond_to do |format|
      if @citation.update(citation_params)
        CitationDetail.delete_all(:citation_id => params[:id])
        
        @productos.each do |p|
          detalle = CitationDetail.new(service_id: p, citation_id:@service.id)
          detalle.save
        end
        
        format.html { redirect_to @citation, notice: 'Citation was successfully updated.' }
        format.json { render :show, status: :ok, location: @citation }
      else
        @services = params[:inputserv]
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_citation
      @citation = Citation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def citation_params
      params.require(:citation).permit(:date, :time, :observation, :state, :service_id)
    end
end
