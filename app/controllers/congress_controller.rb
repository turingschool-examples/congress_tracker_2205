class CongressController < ApplicationController

  def index
    # violations: DRY, SRP, abstraction (controller handling all of it), encapsulation (exposing
    # all of the business logic in the controller)

    @members = CongressFacade.members(params[:state])

    render "welcome/index"
  end

  def search
    conn = Faraday.new(url: "https://api.propublica.org") do |faraday|
      faraday.headers["X-API-KEY"] = ENV['govt_api_key']
    end
    response = conn.get("/congress/v1/116/senate/members.json")

    data = JSON.parse(response.body, symbolize_names: true)

    members = data[:results][0][:members]

    found_members = members.find_all {|m| m[:last_name] == params[:search]}
    @member = found_members.first
    render "welcome/index"
  end
end
