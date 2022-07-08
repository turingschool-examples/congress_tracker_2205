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
    @member = CongressFacade.search_senate(params[:search])
    render "welcome/index"
  end
end
