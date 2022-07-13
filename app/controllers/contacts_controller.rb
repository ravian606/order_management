class ContactsController < ApplicationController
  before_action :get_company_site
  before_action :set_contact, only: %i[ show edit update destroy ]

  # GET /contacts or /contacts.json
  def index
    @contacts = @site.contacts
  end

  # GET /contacts/1 or /contacts/1.json
  def show
  end

  # GET /contacts/new
  def new
    @contact = @site.contacts.build
  end

  # GET /contacts/1/edit
  def edit
  end

  # POST /contacts or /contacts.json
  def create
    @contact = @site.contacts.build(contact_params)

    respond_to do |format|
      if @contact.save
        format.html { redirect_to company_site_contact_path(@company, @site, @contact), notice: "Contact was successfully created." }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contacts/1 or /contacts/1.json
  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to company_site_contact_path(@company, @site, @contact), notice: "Contact was successfully updated." }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1 or /contacts/1.json
  def destroy
    @contact.destroy

    respond_to do |format|
      format.html { redirect_to company_site_contacts_path(@company, @site), notice: "Contact was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def get_company_site
      @company = Company.find(params[:company_id])
      @site = Site.find(params[:site_id])
    end
  
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def contact_params
      params.require(:contact).permit(:title, :first_name, :last_name, :number, :street_address1, :street_address2, :town, :post_code_string, :email, :phone_number, :head_office, :buyer, :invoice, :site_id, :company_id)
    end
end
