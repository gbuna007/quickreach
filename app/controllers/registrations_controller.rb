class RegistrationsController < Devise::RegistrationsController
  def after_sign_up_path_for(resource)
    pages_path
  end
end
