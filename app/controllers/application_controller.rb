class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index
    msg = { :status => "ok", :message => "Success!", lines: rand(1..100) }
    render json: msg
  end
end
