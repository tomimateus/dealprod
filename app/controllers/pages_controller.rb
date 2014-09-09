class PagesController < ApplicationController

  skip_before_filter :authenticate_user!

  def work_with_us
    @message = Message.new
  end

  def form_company
    @message = Message.new
  end

  def form_contact
    @message = Message.new
  end


  def potential_advertiser
    @message=Message.new
  end


  def we

  end

  def faqs
    session[:body]="page-faq"
  end

  def contact_work_with_us
    @message = Message.new
    get_params(@message)
    @message.body = params[:message][:body]
    @message.name = params[:message][:name]
    @message.email = params[:message][:email]
    if @message.valid?
      ContactMailerTrabajaConNosotros.new_message_trabaja_con_nosotros(@message).deliver
      flash.now.alert = "El mensaje se ha enviado correctamente."
      render pages_work_with_us_path

    else
      flash.now.alert = "Completa todos los datos por favor"
      render pages_work_with_us_path
    end

  end

  def contact_recommendation
    @message = Message.new
    get_params(@message)
    @message.body = "Has sido invitado a esta oferta"
    @message.name = "Invitation"
    @message.email = params[:message][:email]
    if @message.valid?
      RecommendOfferMailer.recommend_offer_email(current_user,params[:message][:offer], @message.email).deliver
      flash.now.alert = "El mensaje se ha enviado correctamente."
      redirect_to :back

    else
      flash.now.alert = "Completa todos los datos por favor"
      redirect_to :back
    end

  end


  def sendNewsletter
    Client.all.each do |client|
      NewsletterMailer.newsletter_email(client).deliver
    end
    print("El newsletter se ha enviado")
    redirect_to users_home_view_path
  end

  def sendEndOfferMail
    Offer.all.each do |offer|
      offer.clients.each do |client|
        OfferEndMailer.offer_end_email(client, offer).deliver
      end
    end
    print("El endOfferMail se ha enviado")
    redirect_to users_home_view_path

  end

  def recommendOfferMail
    @user = Client.find(1).user

    Offer.all.each do |offer|
        RecommendOfferMailer.recommend_offer_email(@user, offer, "tatiana.slod@gmail.com")
    end

    print("El recommendOfferMail se ha enviado")
    redirect_to users_home_view_path
  end



  def contact
    @message = Message.new
    get_params(@message)
    @message.body = params[:message][:body]
    @message.subject = params[:message][:subject]
    if !current_user.nil?
      @message.email = current_user.email
      if current_user.company?
        @message.name = Company.where(:user_id => current_user.id).first().name
      else
        @message.name = Client.where(:user_id => current_user.id).first().first_name
        if @message.name.nil?
          @message.name = current_user.email
        end
      end
    end

    if @message.valid?
      ContactMailer.new_message(@message).deliver
      flash.now.alert = "El mensaje se ha enviado correctamente."
      render pages_form_contact_path
    else
      flash.now.alert = "Completa todos los datos por favor"
      render pages_form_contact_path
    end
  end

  def contact_potential_advertiser
    @message = Message.new
    get_params(@message)
    @message.body = params[:message][:body]
    @message.name = params[:message][:name]
    @message.email = params[:message][:email]
    @message.cuit = params[:message][:cuit]
    @message.phone = params[:message][:phone]
    if @message.valid?
      ContactMailer.new_message_empresa(@message).deliver
      flash.now.alert = "El mensaje se ha enviado correctamente."
      render pages_form_company_path
    else
      flash.now.alert = "Completa todos los datos por favor"
      render pages_form_company_path
    end
  end


  def terms_and_conds

  end

  def get_params(message)

    unless current_user.nil?
      if current_user.company?
        unless params[:message].nil?
          data = params[:message]
          message.subject = data[:subject]
          message.body = data[:body]
          message.name = data[:name]
          message.email = data[:email]
        end
      end
    else

      unless params[:message].nil?
        data = params[:message]
        message.subject = data[:subject]
        message.body = data[:body]
        if current_user.nil?
          message.name = data[:name]
          message.email = data[:email]
        else
          if current_user.client.last_name.nil?
            message.name = ""
          else
            message.name = current_user.client.last_name
          end
          message.email = current_user.email
        end
      end
    end
  end


end