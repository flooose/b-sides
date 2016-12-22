require 'netrc'
require 'rest-client'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index
    circleci = Netrc.read()['circleci.com']

    url = "https://circleci.com/api/v1.1/recent-builds?circle-token=#{circleci.login}&limit=20&offset=5"
    payload = RestClient.get(url)
    tests = JSON.parse(payload.body).map do |test|
      test['status']
    end

    failure = tests.index {|o| o != "success"}

    msg = { :status => "ok", :message => "Success!", lines: failure }
    render json: msg
  end
end
