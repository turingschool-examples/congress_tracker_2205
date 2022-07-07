require 'rails_helper'

RSpec.describe 'CongressFacade' do
  # input -> state: 'CO'
  # output -> array of POROs
  # facade: reaching out to services, creating objects, returning the data
  it 'makes services call and returns an array of member objects', :vcr do
    members = CongressFacade.search_house_members('CO')

    expect(members).to be_a Array
    # members.each do |member|
    #   expect(member).to be_a Member
    # end
    expect(members).to be_all Member
  end
end
