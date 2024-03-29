class SitesController < ApplicationController
  before_action :get_company, except: :all_sites
  before_action :set_site, only: %i[ show edit update destroy ]

  # GET /sites or /sites.json
  def index
    if params.dig(:name)
      @sites = params[:name].empty? ? @company.sites : @company.sites.where("lower(name) = ?", params[:name].downcase)
    else
      @sites = @company.sites
    end
  end

  # GET /sites/1 or /sites/1.json
  def show
  end

  # GET /sites/new
  def new
    #byebug
    @site = @company.sites.build
  end

  # GET /sites/1/edit
  def edit
  end

  # POST /sites or /sites.json
  def create
    @site = @company.sites.build(site_params)

    respond_to do |format|
      if @site.save
        format.html { redirect_to company_sites_path(@company), notice: "Site was successfully created." }
        format.json { render :show, status: :created, location: @site }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sites/1 or /sites/1.json
  def update
    respond_to do |format|
      if @site.update(site_params)
        format.html { redirect_to company_sites_path(@company), notice: "Site was successfully updated." }
        format.json { render :show, status: :ok, location: @site }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sites/1 or /sites/1.json
  def destroy
    @site.destroy

    respond_to do |format|
      format.html { redirect_to company_sites_path(@company), notice: "Site was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def all_sites
    if params.dig(:name)
      @sites = params[:name].empty? ? Site.all : Site.where("lower(name) = ?", params[:name].downcase)
    else
      @sites = Site.all
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_site
      @site = Site.find(params[:id])
    end

    def get_company
      @company = Company.find(params[:company_id])
    end

    # Only allow a list of trusted parameters through.
    def site_params
      params.require(:site).permit(:name, :number, :street_address_one, :street_address_two, :town, :post_code, :head_office, :invoice_address, :contact, :invoice_email, :phone_number, :payment_method, :company_id)
    end
end
