class ClientsOffersController < ApplicationController
  # GET /clientsOffers
  # GET /clientsOffers.json
  def index
    @clientsOffers = ClientsOffers.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @clientsOffers }
    end
  end

  # GET /clientsOffers/1
  # GET /clientsOffers/1.json
  def show
    @clientsOffers = ClientsOffers.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @clientsOffers }
    end
  end

  # GET /clientsOffers/new
  # GET /clientsOffers/new.json
  def new
    @clientsOffers = ClientsOffers.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @clientsOffers }
    end
  end

  # GET /clientsOffers/1/edit
  def edit
    @clientsOffers = ClientsOffers.find(params[:id])
  end

  # POST /clientsOffers
  # POST /clientsOffers.json
  def create
    @clientsOffers = ClientsOffers.new(params[:clientsOffers])

    respond_to do |format|
      if @clientsOffers.save
        format.html { redirect_to @clientsOffers, notice: 'ClientsOffers was succesfully created.' }
        format.json { render json: @clientsOffers, status: :created, location: @clientsOffers }
      else
        format.html { render action: "new" }
        format.json { render json: @clientsOffers.errors, status: :unprocesable_entity }
      end
    end
  end

  # PUT /clientsOffers/1
  # PUT /clientsOffers/1.json
  def update
    @clientsOffers = ClientsOffers.find(params[:id])

    respond_to do |format|
      if @clientsOffers.update_attributes(params[:clientsOffers])
        format.html { redirect_to @clientsOffers, notice: 'ClientsOffers was succesfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @clientsOffers.errors, status: :unprocesable_entity }
      end
    end
  end

  # DELETE /clientsOffers/1
  # DELETE /clientsOffers/1.json
  def destroy
    @clientsOffers = ClientsOffers.find(params[:id])
    @clientsOffers.destroy

    respond_to do |format|
      format.html { redirect_to clientsOffers_url }
      format.json { head :no_content }
    end
  end
end

