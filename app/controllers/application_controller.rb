class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include Response
  include ExceptionHandler
  include Pundit

  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :index
end
