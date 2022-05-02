class RegistrationsController < Devise::RegistrationsController

  protected

  def after_sign_up_path_for(resource)
    case resource
    when :user, User
      root_path
    else
      super
    end
  end

  def after_update_path_for(resource)
    case resource
    when :user, User
      root_path
    else
      super
    end
  end

  def after_sign_out_path_for(resource)
    case resource
    when :user, User
      root_path
    else
      super
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password)
  end
end