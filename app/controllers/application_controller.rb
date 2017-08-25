class ApplicationController < ActionController::Base
  before_action :authorize
  protect_from_forgery with: :exception

  protected

    def authorize
      unless User.find_by(id: session[:user_id]) or User.take == nil
        redirect_to login_url, notice: "Please log in"
      end
    end
end