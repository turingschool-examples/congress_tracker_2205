class CongressController < ApplicationController

  def index
    @state = params[:state]
    @members = CongressFacade.search_house_members(@state)

    render "welcome/index"
  end

  def search
    @member = CongressFacade.search_senate(params[:search])

    render "welcome/index"
  end
end
