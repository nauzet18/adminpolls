class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  def param_sizes(**fields)
    fields.map do |key, proc|
      params[key].try(proc)
    end.all?
  end

end
