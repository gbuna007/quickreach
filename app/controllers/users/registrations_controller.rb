class Users::RegistrationsController < Devise::SessionsController
  # def new
  #   # accounts_path(resource) if is_navigational_format?
  # end

  def after_sign_up_path_for(resource)
    raise
    if current_user.accounts.count.positive?
      # if user already integrated their CRM
      accounts_path(resource)
    else
      # if user hasn't integrated
      pages_path(resource)
    end

    # after_sign_in_path_for(resource) if is_navigational_format?
  end

  def after_sign_in_path_for(resource)
    raise
  end
end
