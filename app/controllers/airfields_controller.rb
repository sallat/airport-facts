class AirfieldsController < ApplicationController
  # GET /airfields
  # GET /airfields.json
  
  before_filter :authenticate_admin!, :only => [:new, :create, :destroy, :update]
  
  caches_action :index, :layout => false
  
  def index
    @airfields = Airfield.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @airfields }
    end
  end

  # GET /airfields/1
  # GET /airfields/1.json
  def show
    @airfield = Airfield.find(params[:id])
    
    @reviews = @airfield.reviews
    
    @json = Airfield.find(params[:id]).to_gmaps4rails
    
    @arr=[] 
    if @reviews.count !=0
    @reviews.each do |review|
          if review.rating != nil
            @arr<< review.rating
          end
        end
          if @arr.count  != 0
              @avg= ((@arr.inject(:+))/@arr.count).round(1)
          end
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @airfield }
    end
  end

  # GET /airfields/new
  # GET /airfields/new.json
  def new
    @airfield = Airfield.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @airfield }
    end
  end

  # GET /airfields/1/edit
  def edit
    @airfield = Airfield.find(params[:id])
  end

  # POST /airfields
  # POST /airfields.json
  def create
    expire_action :action => :index
    #@airfield = Airfield.new(params[:airfield])
    
    csv_text = File.read(open('https://commondatastorage.googleapis.com/ckannet-storage/2012-07-09T214020/global_airports.csv'))
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
    row = row.to_hash.with_indifferent_access
    @airfield=Airfield.find_or_create_by_airport_id!(row.to_hash.symbolize_keys)
    @airfield.update_attributes(row.to_hash.symbolize_keys)
    end
    #respond_to do |format|
      #if @airfield.save
        #format.html { redirect_to @airfield, notice: 'Airfield was successfully created.' }
        #format.json { render json: @airfield, status: :created, location: @airfield }
      #else
       # format.html { render action: "new" }
        #format.json { render json: @airfield.errors, status: :unprocessable_entity }
      #end
    #end
    redirect_to(airfields_path, :notice => "Airports were successfully updated")
  end

  # PUT /airfields/1
  # PUT /airfields/1.json
  def update
    @airfield = Airfield.find(params[:id])

    respond_to do |format|
      if @airfield.update_attributes(params[:airfield])
        format.html { redirect_to @airfield, notice: 'Airfield was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @airfield.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /airfields/1
  # DELETE /airfields/1.json
  def destroy
    @airfield = Airfield.find(params[:id])
    @airfield.destroy

    respond_to do |format|
      format.html { redirect_to airfields_url }
      format.json { head :no_content }
    end
  end
end
