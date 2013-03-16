class ContactsController < ApplicationController
  # GET /contacts
  # GET /contacts.json

  # GET /contacts/1
  # GET /contacts/1.json
  before_filter :authenticate_admin!, :only => [:index]
  
  def index
    @contacts = Contact.all
  end

  # GET /contacts/new
  # GET /contacts/new.json
  def new
    @contact = Contact.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @contact }
    end
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = Contact.new(params[:contact])

    respond_to do |format|
      if @contact.save
        Request.contact_us(@contact).deliver
        
        format.html { redirect_to(root_path, :notice => '"Thank you for contacting us, we will get back to you as soon as possible."') }
        format.json { render :json => @contact, :status => :created, :location => @contact }
      else
        format.html { render action: "new" }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end
end
