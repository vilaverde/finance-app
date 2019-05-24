class Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController
  skip_before_action :authenticate_user!, only: :create
  skip_after_action :verify_authorized, only: :create
end
