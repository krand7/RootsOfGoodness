class Users::RegistrationsController < Devise::RegistrationsController
before_filter :configure_sign_up_params, only: [:create]
before_filter :configure_account_update_params, only: [:update]

before_action :check_admin!

  # GET /resource/sign_up
  def new
    # super
    redirect_to root_path
  end

  # POST /resource
  def create
    # super
    redirect_to root_path
  end

  # GET /resource/edit
  def edit
    super
    # redirect_to root_path
  end

  # PUT /resource
  def update
    super
    # redirect_to root_path
  end

  # DELETE /resource
  def destroy
    # super
    redirect_to root_path
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  def cancel
    super
  end

  protected

  # You can put the params you want to permit in the empty array.
  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation,)
  end

  # You can put the params you want to permit in the empty array.
  #   devise_parameter_sanitizer.for(:account_update) << :attribute
  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation,)
  end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    root_path
  end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
  private

  def check_admin!
    redirect_to root_path and return unless (current_user and current_user.admin?)
  end

end
