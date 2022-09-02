class Users::RegistrationsController < Devise::SessionsController
  # def new
  #   # accounts_path(resource) if is_navigational_format?
  # end

  def after_sign_up_path_for(resource)
    pages_path(resource)
  end
end
