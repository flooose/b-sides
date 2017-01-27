class GittesController < ApplicationController

  #protect_from_forgery with: :exception
  skip_before_filter :verify_authenticity_token

  def index
    circleci = Netrc.read()['circleci.com']

    url = "https://circleci.com/api/v1.1/recent-builds?circle-token=#{circleci.login}"
    payload = RestClient.get(url)

    tests = JSON.parse(payload.body)
    tests = tests.group_by { |group| group["reponame"] }
    tests = tests[Gitte.first.reponame]
    tests.map do |test|
      test['status']
    end

    failure = tests.index {|o| o == "failed" || o == "cancelled"}
    if !failure
      failure = 0
    elsif
      failure > 4
      failure = 4
    end

    msg = { :status => "ok", :message => "Success!", lines: failure }
    render json: msg
  end

  def create
    # change this when we support new urls
    circleci = Netrc.read()['circleci.com']
    url = "https://circleci.com/api/v1.1/recent-builds?circle-token=#{circleci.login}"

    gitte = Gitte.new(url: url, reponame: params[:reponame])
    if gitte.save
      render json: {status: "ok", url: gitte.url, reponame: gitte.reponame}
    else
      render json: {status: :error,
                    url: gitte.url,
                    reponame: gitte.reponame,
                    message: gitte.errors}, status: :error
    end
  end

  private
  def gitte_params
    params.require(:url, :reponame)
  end

end
