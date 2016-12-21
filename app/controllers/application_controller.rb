class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index
    msg = { :status => "ok", :message => "Success!", :html => "<b>...</b>" }
    render json: msg
  end
end
