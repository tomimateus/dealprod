class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    session[:body]='page-micuenta'
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    session[:body]='page-micuenta'

    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    session[:body]='page-micuenta'
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    session[:body]='page-micuenta'
    @user = User.new(params[:user])
    @user.user_role = UserRole.where("name = ?", "ClientUSer" ).first()
    respond_to do |format|
      if @user.save
        @client = Client.new
        @client.user = @user
        @client.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update

    @user = User.find(params[:id])
    respond_to do |format|
    if @user.user_role_id == 2

      client = @user.client
      client_attr = params[:user][:client_attributes]
      unless client_attr.nil?
        address_attr = client_attr[:address_attributes]
        client.first_name = client_attr[:first_name]
        client.last_name = client_attr[:last_name]
        address = Address.new
        address = client.address unless client.address.nil?
        address.street = address_attr[:street]
        address.floor = address_attr[:floor]
        address.state = address_attr[:state]
        address.number = address_attr[:number]
        address.city = address_attr[:city]
        address.country_id = address_attr[:country_id]
        address.client_id = client.id
        address.save
        client.address = address
        client.save
      end
    end
      if @user.update_attribute(:email,params[:user][:email])
        sign_in(@user, :bypass => true)
        format.html { redirect_to edit_user_path(@user), notice: 'Se han registrado los cambios en su perfil.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity, notice: 'No se han podido cambiar sus datos.' }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    session[:body]='page-micuenta'
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  def offers_company_user
    session[:body]='page-micuenta'
    @user = current_user

    @offers = Offer.where(:branch_id => Branch.where(:company_id => @user.company.id)).page(params[:page]).per(3)
    @actual_offers = Offer.actual.where(:branch_id => Branch.where(:company_id => @user.company.id)).page(params[:page]).per(3)
    @old_offers = Offer.ended.where(:branch_id => Branch.where(:company_id => @user.company.id)).page(params[:page]).per(3)
  end

  def offers_client_user
    session[:body]='page-micuenta'
    @user = current_user
    @offers = current_user.client.offers.page(params[:page]).per(3)
    @actual_offers = current_user.client.offers.actual.page(params[:page]).per(3)
    @old_offers = current_user.client.offers.ended.page(params[:page]).per(3)
  end

  def titles_user
    @user = current_user

  end

  def save_titles_user
    @user = current_user
    titles = params[:title_ids]
    unless titles.nil?
      ClientsTitles.where("client_id = ?", @user.client.id).each do |relation|
        relation.destroy
      end
      titles.each do |title_id|
        title = Title.find(title_id)
        @user.client.titles.push(title)
      end
    end
    ClientsTitles.all.each do |c|
      if c.weight.nil?
        c.weight = 1
        c.save!
      end
    end
    redirect_to users_titles_user_path, :notice => "Se han guardado sus intereses"

  end

  def branches_company_user
    session[:body]='page-micuenta'
    @user = current_user
    @branches = Branch.where("company_id = ?",@user.company.id).page(params[:page]).per(4)
    @e = params[:e]
  end

  def home
    if current_user.company?
       redirect_to users_home_view_path
    end
  end

  def home_view
    session[:body]='offer-listing-page'
    @user = current_user
    @offers = Array.new
    if @user.company?
      @offers = Offer.actual.where(:branch_id => Branch.select(:id).where(:company_id => @user.company.id)).order("created_at DESC").take(6)
    else
      current_client =  current_user.client.id
      offers=Array.new
      Offer.actual.each do |offer|
        if offer.weight(current_client)>0
          offers.append(offer)
        end
      end
      @offers=offers.sort_by {|e| e.get_current_weight}.reverse

    end
  end

  def homeee_view(branch)
    session[:body]='offer-listing-page'
    @user = current_user
    @offers = Array.new
    if @user.user_role_id == 1 #company
      @offers = Offer.actual.where(:branch_id => Branch.select(:id).where(:company_id => @user.company.id)).order("created_at DESC").take(6)
    else
      clients_titles = ClientsTitles.select("title_id, weight").where(:client_id => Client.where(:user_id => @user.id))
      @offers = Offer.actual.where(:id => OffersTitles.select("offer_id").where(:title_id => clients_titles)).all
    end
  end

  def home_map
    @user = current_user
    @offers = Array.new
    @longitude = -58.4
    @latitude = -34.6
    @json = Offer.actual.to_gmaps4rails
    address = Address.new
    if @user.user_role_id == 2
      address = @user.client.address
      unless (address.nil? || address.longitude.nil? || address.latitude.nil?)
        @longitude = address.longitude
        @latitude = address.latitude
      end
      #Mostrar solo los que interesen
      #@json = Address.where(:branch_id => Branch.select(:id).where(:company_id => @user.company.id)).take(10).to_gmaps4rails
    else if @user.user_role_id == 1
      address = @user.company.branches.first.address
      @json = Address.where(:branch_id => Branch.select(:id).where(:company_id => @user.company.id)).take(10).to_gmaps4rails
    end
    end
    unless address.nil?
      @latitude = address.latitude
      @longitude = address.longitude
    end
  end

  def inscribe
    offer_id = params[:offer_id]
    client_id = Client.where(:user_id => current_user.id).first.id
    clients_offers = ClientsOffer.new
    clients_offers.client_id = client_id
    clients_offers.offer_id = offer_id

    #ponderar clients_titles
    offer = Offer.find(params[:offer_id])
    offer.titles.each do|t|
      client_title = ClientsTitles.where(:client_id => client_id, :title_id => Title.select(:id).where(:id => t.id)).first()
      unless client_title.nil?
        client_title.weight += 1
        client_title.save
      end
    end

    #ponderar clients_companies
    company_id = Branch.where(:id => offer.branch_id).first().company_id
    clients_companies = ClientsCompany.where(:client_id => client_id, :company_id => company_id).first
    if clients_companies.nil?
      clients_companies = ClientsCompany.new
      clients_companies.client_id = client_id
      clients_companies.company_id = company_id
      clients_companies.weight = 1
    else
      clients_companies.weight += 1
    end
    clients_companies.save

    if clients_offers.save
      redirect_to offer_path(Offer.find_by_id(offer_id))
    end
  end

  def unsubscribe
    clients_offers = ClientsOffer.find(params[:clients_offers_id])
    client_id = Client.where(:user_id => current_user.id).first.id

    #ponderar clients_titles
    offer = Offer.find(clients_offers.offer_id)
    offer.titles.each do|t|
      client_title = ClientsTitles.where(:client_id => client_id, :title_id => Title.select(:id).where(:id => t.id)).first()
      unless client_title.nil?
        client_title.weight -= 1
        client_title.save
      end
    end


    #ponderar clients_companies
    company_id = Branch.where(:id => offer.branch_id).first().company_id
    clients_companies = ClientsCompany.where(:client_id => client_id, :company_id => company_id).first
    clients_companies.weight -= 1
    clients_companies.save



    if clients_offers.destroy
      redirect_to offer_path(Offer.find_by_id(params[:offer_id]))
    end
  end

  def change_newsletter_frequency
    session[:body]='page-micuenta'
    if !params[:user].nil?
      current_user.client.newsletter_frequency_id=params[:user][:client_attributes][:newsletter_frequency_id]
      if current_user.client.save
        redirect_to :back, :notice => "Se ha cambiado correctamente la frecuencia del newsletter"
      end
    end

  end


  def statistics
    @user = current_user
    @months = ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre']
    if @user.client.nil?
      @offers = offers_data
      @comp = comp_data
    else
      @titles = titles_data
      @activity = activity_data
    end

    puts '@user'
  end

  def titles_data
    titles = Hash.new
    Title.all.each do |t|
      titles[t.name] = 0
    end
    co = ClientsOffer.find_all_by_client_id(current_user.client.id)
    co.each do |c|
      offer_id = c.offer_id
      ot = OffersTitles.find_all_by_offer_id(offer_id)
      ot.each do |o|
        title = Title.find(o.title_id)
        titles[title.name] = titles[title.name] + 1
      end
    end
    return titles
  end

  def activity_data
    amounts = Array.new
    @months.each do |m|
      amounts.push([m, 0, 0])
    end
    co = ClientsOffer.find_all_by_client_id(@user.client.id)
    co.each do |c|
      o = Offer.find(c.offer_id)
      m = @months[o.created_at.mon - 1]
      a = amounts[@months.find_index(m)]
      a[1] = a[1] + 1
      a[2] = a[2] + 1 if c.participated
    end
    return amounts
  end

  def offers_data
    offers = Array.new
    @months.each do |m|
      offers.push([m, 0, 0])
    end
    os = Array.new
    @user.company.branches.each do |b|
      os = os.concat(Offer.find_all_by_branch_id(b.id))
    end
    os.each do |o|
      m = @months[o.created_at.mon - 1]
      a = offers[@months.find_index(m)]
      a[1] = a[1] + 1
      a[2] = a[2] + 1 if o.end_date < Date.current
    end
    return offers
  end

  def comp_data
    comp = Hash.new
    Title.all.each do |t|
      comp[t.name] = 0
    end
    os = Array.new
    Offer.all.each do |o|
      os.push(o) unless o.branch.company_id == @user.company.id
    end
    os.each do |o|
      ot = OffersTitles.find_all_by_offer_id(o.id)
      ot.each do |t|
        title = Title.find(t.title_id)
        comp[title.name] = comp[title.name] + 1
      end
    end
    return comp
  end
end
