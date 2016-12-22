require 'netrc'
require 'rest-client'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index
    circleci = Netrc.read()['circleci.com']

    url = "https://circleci.com/api/v1.1/recent-builds?circle-token=#{circleci.login}"
    payload = RestClient.get(url)
    tests = JSON.parse(payload.body).map do |test|
      test['status']
    end

    failure = tests.index {|o| o == "failed" || o == "cancelled"}
    if !failure
      failure = 0
    end

    msg = { :status => "ok", :message => "Success!", lines: failure }
    render json: msg
  end
end
