# app/controllers/registrations_controller.rb
class RegistrationsController < Devise::RegistrationsController

def create
    @user = User.new(params[:user])
    @user.user_role_id = 2
    address = Address.new()
    client = Client.new()
    client.user=@user
    address.client=client
    if @user.save
      client.save
      address.save


      NewUserMailer.new_client_email(@user).deliver

      if @user.active_for_authentication?
        sign_in("user", @user)
        #respond_with @user, :location => after_sign_up_path_for(@user)
        respond_with @user, :location => edit_user_path(@user)

      else
        expire_session_data_after_sign_in!
        respond_with @user, :location => after_inactive_sign_up_path_for(@user)
      end
    else
      clean_up_passwords @user
      $user=@user
      redirect_to new_user_registration_path(:registration => false)
      #redirect_to :back
    end
  end

  def new
    @alert = params[:registration]
    super
  end

  def edit
    super
  end

  def update
    @user = current_user
    if @user.update_with_password(params[:user])
      sign_in(@user, :bypass => true)
      redirect_to edit_user_path(@user), :notice => "Los datos se han actualizado."
    else
      @alert = true
      render :edit #,:locals => { :resource => @user, :resource_name => "user" }
    end
  end
end