class CongressController < ApplicationController

  def index
    # Violations: Abstraction, encapsulation, SRP, reusability/extendability
    # done - Facade: reaches out to services, create objects, return data back to controller
    # done - Service: pull the Faraday connection, call + response -- interactions with exernal API
    # done - PORO: Member, plain old ruby object -- takes parsed JSON and converts it into objects we can use
    state = params[:state]
    @members = CongressFacade.search_house_members(state)

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
