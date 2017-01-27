require 'netrc'
require 'rest-client'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
end
