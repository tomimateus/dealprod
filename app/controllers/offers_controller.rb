class OffersController < ApplicationController
  # GET /offers
  # GET /offers.json
  def index
    @offers = Offer.all
    @json = Address.all.to_gmaps4rails
    @latitude = -34.603683
    @longitude = -58.381244
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @offers }
    end
  end

  # GET /offers/1
  # GET /offers/1.json
  def show
    @user = current_user
    @offer = Offer.find(params[:id])
    @offer_prizes = @offer.prizes
    @offer_clients = ClientsOffer.find_all_by_offer_id(params[:id])

    address = @offer.branch.address
    @latitude = address.latitude
    @longitude = address.longitude
    addresses = Array.new
    addresses.push(address)
    #@json = addresses.to_gmaps4rails
    @json = @offer.to_gmaps4rails

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @offer }
    end
  end

  # GET /offers/new
  # GET /offers/new.json
  def new
    @offer = Offer.new
    @user = current_user
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @offer }
    end
  end

  # GET /offers/1/edit
  def edit
    session[:body]='page-micuenta'
    @offer = Offer.find(params[:id])
  end

  # POST /offers
  # POST /offers.json
  def create
    offer = params[:offer]
    @offer = Offer.new
    @offer.prizes_attributes = offer[:prizes_attributes]
    @offer.name = offer[:name]
    @offer.start_date = offer[:start_date]
    @offer.end_date = offer[:end_date]
    @offer.created_at = Time.now
    @offer.updated_at = Time.now
    @offer.photo = offer[:photo]
    @offer.branch = Branch.find(offer[:branch_id])
    @offer.description = offer[:description]
    @offer.start_date = @offer.start_date.change({:hour => (offer[:start_hour]).to_i})
    @offer.end_date = @offer.end_date.change({:hour => (offer[:end_hour]).to_i})


    respond_to do |format|
      if params[:title_ids].nil?
        format.html { redirect_to :back , notice: @offer.name + ' posee errores o no posee intereses.' }
      end
      if @offer.save
        title_ids = params[:title_ids]
        unless title_ids.nil?
          title_ids.each do |id|
            offers_titles = OffersTitles.new
            offers_titles.offer_id = @offer.id
            offers_titles.title_id = id
            offers_titles.save
          end
        end
        format.html { redirect_to users_offers_company_user_path , notice: @offer.name + ' fue creada correctamente.' }
        format.json { render json: @offer, status: :created, location: @offer }
      else
        format.html { render action: "new" }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /offers/1
  # PUT /offers/1.json
  def update
    @offer = Offer.find(params[:id])
    offer = params[:offer]
    unless offer.nil?
      @offer.prizes_attributes = offer[:prizes_attributes] unless offer[:prizes_attributes].nil?
      @offer.name = offer[:name]
      @offer.start_date = offer[:start_date]
      @offer.end_date = offer[:end_date]
      @offer.created_at = Time.now
      @offer.updated_at = Time.now
      @offer.photo = offer[:photo]
      @offer.branch = Branch.find(offer[:branch_id])
      @offer.description = offer[:description]
      @offer.start_date = @offer.start_date.change({:hour => (offer[:start_hour]).to_i})
      @offer.end_date = @offer.end_date.change({:hour => (offer[:end_hour]).to_i})
      respond_to do |format|
        if @offer.save
          title_ids = params[:title_ids]
          unless title_ids.nil?
            ot = OffersTitles.find_all_by_offer_id(@offer.id)
            ot.each do |o|
              o.destroy
            end
            title_ids.each do |id|
#              unless @offer.prefer(Title.find(id))
                offers_titles = OffersTitles.new
                offers_titles.offer_id = @offer.id
                offers_titles.title_id = id
                offers_titles.save
 #             end
            end
          end
          format.html { redirect_to @offer, notice: 'La oferta fue actualizada correctamente' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @offer.errors, status: :unprocessable_entity }
        end
      end
    end
    if @offer.nil?
      format.html { redirect_to @offer }
      format.json { head :no_content }
    end
  end

  # DELETE /offers/1
  # DELETE /offers/1.json
  def destroy
    @offer = Offer.find(params[:id])
    name = @offer.name
    @offer.destroy

    respond_to do |format|
      format.html { redirect_to users_offers_company_user_path , notice: name + ' se ha eliminado.' }
      format.json { head :no_content }
    end
  end

  def results
    @offer = Offer.find(params[:id])
    @offer_clients = ClientsOffer.find_all_by_offer_id(params[:id])
    @offer_prizes = @offer.prizes
  end

  def save_results
    @offer = Offer.find(params[:offer][:id])
    @offer.clients.each do |c|
      position = params[c.user.id.to_s].to_i
      participation = ClientsOffer.find_by_client_id_and_offer_id(c.id, @offer.id)
      participation.participated = position!=0
      participation.position = position
      participation.save
    end

    respond_to do |format|
      format.html { redirect_to @offer, notice: 'Los resultados se han guardado.' }
    end
  end

end

