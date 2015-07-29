class CitationDetailsController < ApplicationController
  before_action :set_citation_detail, only: [:show, :edit, :update, :destroy]

  # GET /citation_details
  # GET /citation_details.json
  def index
    @citation_details = CitationDetail.all
  end

  # GET /citation_details/1
  # GET /citation_details/1.json
  def show
  end

  # GET /citation_details/new
  def new
    @citation_detail = CitationDetail.new
  end

  # GET /citation_details/1/edit
  def edit
  end

  # POST /citation_details
  # POST /citation_details.json
  def create
    @citation_detail = CitationDetail.new(citation_detail_params)

    respond_to do |format|
      if @citation_detail.save
        format.html { redirect_to @citation_detail, notice: 'Citation detail was successfully created.' }
        format.json { render :show, status: :created, location: @citation_detail }
      else
        format.html { render :new }
        format.json { render json: @citation_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /citation_details/1
  # PATCH/PUT /citation_details/1.json
  def update
    respond_to do |format|
      if @citation_detail.update(citation_detail_params)
        format.html { redirect_to @citation_detail, notice: 'Citation detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @citation_detail }
      else
        format.html { render :edit }
        format.json { render json: @citation_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /citation_details/1
  # DELETE /citation_details/1.json
  def destroy
    @citation_detail.destroy
    respond_to do |format|
      format.html { redirect_to citation_details_url, notice: 'Citation detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_citation_detail
      @citation_detail = CitationDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def citation_detail_params
      params.require(:citation_detail).permit(:quantity, :amount, :citation_id, :client_id)
    end
end
